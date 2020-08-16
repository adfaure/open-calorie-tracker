// These imports are only needed to open the database
/*  This file is part of the open calorie tracker project. 
 *  This application helps you to track the consumed calories on a daily basis.
 *  Copyright (C) 2020. Adrien FAURE
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>. */

import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'db_helper.g.dart';

class Objectives extends Table {
  IntColumn get objective => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()();

  @override
  Set<Column> get primaryKey => {date, type};
}

// Food Models contains the food that will be added.
// It can be changed at any time without consequences on the database
class FoodModels extends Table {
  // Uniq ID
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  // Portion should be 100...
  IntColumn get portion => integer()();
  // The unit ml, g.
  TextColumn get unit => text()();

  // In some cases products are distributed as one unit, or several unit per box.
  // This is the case for chocolate bar for instance.
  IntColumn get serving => integer().nullable()();
  TextColumn get servingUnit => text().nullable()();

  IntColumn get calorie => integer()();

  // The source of the data (idk exactly yet...)
  TextColumn get source => text().nullable()();
  // If set it is from openfoodfacts
  TextColumn get barcode => text().nullable()();

  IntColumn get lipids => integer().nullable()();
  IntColumn get carbohydrates => integer().nullable()();
  IntColumn get proteins => integer().nullable()();
}

class ConsumedFoods extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Informations
  TextColumn get name => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get mealType => text()();
  IntColumn get quantity => integer()();

  // Calorie
  IntColumn get portion => integer()();
  TextColumn get unit => text()();
  IntColumn get calorie => integer()();
  // Nutriment
  IntColumn get lipids => integer().nullable()();
  IntColumn get carbohydrates => integer().nullable()();
  IntColumn get proteins => integer().nullable()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    // file.delete();
    return VmDatabase(file);
  });
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(
  tables: [FoodModels, ConsumedFoods, Objectives],
)
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  // returns the generated id
  Future<int> addFoodModel(FoodModelsCompanion entry) {
    return into(foodModels).insert(entry);
  }

  // returns the generated id
  Future<int> upsertFoodModel(FoodModelsCompanion entry) {
    return into(foodModels).insertOnConflictUpdate(entry);
  }

  Future upsertConsumedFood(ConsumedFoodsCompanion entry) {
    return update(consumedFoods).replace(entry);
  }

  Future updateConsumedFoodMealType(int id, String mealType) {
    return (update(consumedFoods)..where((t) => t.id.equals(id)))
        .write(ConsumedFoodsCompanion(mealType: Value(mealType)));
  }

  Future<int> addConsumedFood(ConsumedFoodsCompanion entry) {
    return into(consumedFoods).insert(entry);
  }

  // loads all todo entries
  Future<List<FoodModel>> get allFoodEntries => select(foodModels).get();

  // The stream will automatically emit new items whenever the underlying data changes.
  Stream<List<FoodModel>> watchEntriesInFoods() {
    return (select(foodModels)).watch();
  }

  // The stream will automatically emit new items whenever the underlying data changes.
  Stream<List<ConsumedFood>> watchEntriesInDailyFoods(
      DateTime selectDate, String meal) {
    return (select(consumedFoods)
          ..where((a) => a.date.equals(selectDate) & a.mealType.equals(meal)))
        .watch();
  }

  Future getFoodModelByBarcode(String barcode) {
    return (select(foodModels)..where((tbl) => tbl.barcode.equals(barcode)))
        .get();
  }

  Future deleteFoodModel(FoodModel entry) {
    return delete(foodModels).delete(entry);
  }

  Future deleteConsumedFood(ConsumedFood entry) {
    return delete(consumedFoods).delete(entry);
  }

  Future updtateFood(FoodModel entry) {
    return update(foodModels).replace(entry);
  }

  // Because we want to have only one objective per day (at most).
  // On inserting, if the date already exists, we replace the previous row.
  Future<void> createOrUpdateObjective(Objective entity) {
    return into(objectives).insertOnConflictUpdate(entity);
  }

  Stream<int> watchTotalDailyCalorieMeal(DateTime selectDate, String meal) {
    return (select(consumedFoods)
          ..where((a) => a.date.equals(selectDate) & a.mealType.equals(meal)))
        .watch()
        .map((rows) {
      return rows.map((row) {
        return row;
      }).fold(0, (previousValue, consumedFood) {
        var caloriesPerUnit = consumedFood.calorie / consumedFood.portion;
        var total = previousValue + (consumedFood.quantity * caloriesPerUnit);
        return total.round();
      });
    });
  }

  Stream<int> watchTotalDailyCalorie(DateTime selectDate) {
    return (select(consumedFoods)..where((a) => a.date.equals(selectDate)))
        .watch()
        .map((rows) {
      return rows.map((row) {
        return row;
      }).fold(0, (previousValue, consumedFood) {
        var caloriesPerUnit = consumedFood.calorie / consumedFood.portion;
        var total = previousValue + (consumedFood.quantity * caloriesPerUnit);
        return total.round();
      });
    });
  }

  Stream<List<int>> watchTotalDailyNutriments(DateTime selectDate) {
    return (select(consumedFoods)..where((a) => a.date.equals(selectDate)))
        .watch()
        .map((rows) {
      return rows.map((row) {
        return row;
      }).fold(List<int>.from([0, 0, 0]), (previousValue, consumedFood) {
        previousValue[0] += consumedFood.proteins;
        previousValue[1] += consumedFood.carbohydrates;
        previousValue[2] += consumedFood.lipids;
        return previousValue;
      });
    });
  }

  Stream<List<int>> watchTotalCalorieAndDailyNutriments(DateTime selectDate) {
    return (select(consumedFoods)..where((a) => a.date.equals(selectDate)))
        .watch()
        .map((rows) {
      return rows.map((row) {
        return row;
      }).fold(List<int>.from([0, 0, 0, 0]), (previousValue, consumedFood) {
        previousValue[0] += consumedFood.calorie;
        previousValue[1] += consumedFood.proteins;
        previousValue[2] += consumedFood.carbohydrates;
        previousValue[3] += consumedFood.lipids;
        return previousValue;
      });
    });
  }

  getObjective(DateTime _date, String _type) {
    return (select(objectives)
          ..where((tbl) {
            return tbl.date.equals(_date) & tbl.type.equals(_type);
          }))
        .getSingle();
  }

  watchObjective(DateTime _date, String _type) {
    return (select(objectives)
          ..where((tbl) {
            return tbl.date.equals(_date) & tbl.type.equals(_type);
          }))
        .watchSingle();
  }

  /// In the case we go to far in the past, I get the first value of the database.
  getObjectiveUpper() {
    return (select(objectives)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.date, mode: OrderingMode.asc)])
          ..limit(1))
        .getSingle();
  }

  /// https://github.com/simolus3/moor/issues/188
  /// Only for devellopement,
  /// the if(true ...) should be transformed to check a debug (or dev) mode flag instead
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) {
      // Custom statement to enable primary key
      customStatement('PRAGMA foreign_keys = ON;');
      return m.createAll();
    }, beforeOpen: (openingDetails) async {
      if (true /* or some other flag */) {
        final m = createMigrator(); // changed to this
        for (final table in allTables) {
          // await m.deleteTable(table.actualTableName);
          // await m.createTable(table);
        }
      }
    });
  }
}
