// These imports are only needed to open the database
import 'package:flutter/rendering.dart';
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
  @override
  Set<Column> get primaryKey => {date};
}

// This will generate a table called "Food" for us. The rows of that table will
// be represented by a class called "Food".
class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
  IntColumn get portion => integer()();
  IntColumn get calorie => integer()();
  TextColumn get unit => text()();
}

class ConsumedFoods extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get food => integer()();
  IntColumn get quantity => integer()();
  TextColumn get mealType => text()();

  @override
  List<String> get customConstraints =>
      ["FOREIGN KEY(food) REFERENCES foods(id) ON DELETE RESTRICT"];
}

class ConsumedFoodsWitFood {
  final Food food;
  final ConsumedFood consumedFood;

  ConsumedFoodsWitFood({@required this.food, @required this.consumedFood});

  int consumedCalories() {
    if (food == null) {
      return 0;
    }
    var caloriesPerUnit = food.calorie / food.portion;
    var total = consumedFood.quantity * caloriesPerUnit;
    return total.round();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    file.delete();
    debugPrint("$file");
    return VmDatabase(file);
  });
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(
  tables: [Foods, ConsumedFoods, Objectives],
)
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  // returns the generated id
  Future<int> addTodo(FoodsCompanion entry) {
    return into(foods).insert(entry);
  }

  Future<int> addConsumedFood(ConsumedFoodsCompanion entry) {
    return into(consumedFoods).insert(entry);
  }

  // loads all todo entries
  Future<List<Food>> get allFoodEntries => select(foods).get();

  // The stream will automatically emit new items whenever the underlying data changes.
  Stream<List<Food>> watchEntriesInFoods() {
    return (select(foods)).watch();
  }

  // The stream will automatically emit new items whenever the underlying data changes.
  Stream<List<ConsumedFoodsWitFood>> watchEntriesInDailyFoods(
      DateTime selectDate, String meal) {
    return (select(consumedFoods)
          ..where((a) => a.date.equals(selectDate) & a.mealType.equals(meal)))
        .join([leftOuterJoin(foods, foods.id.equalsExp(consumedFoods.food))])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return ConsumedFoodsWitFood(
                food: row.readTable(foods),
                consumedFood: row.readTable(consumedFoods));
          }).toList();
        });
  }

  watchTotalDailyCalorieMeal(DateTime selectDate, String meal) {
    return (select(consumedFoods)
          ..where((a) => a.date.equals(selectDate) & a.mealType.equals(meal)))
        .join([leftOuterJoin(foods, foods.id.equalsExp(consumedFoods.food))])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return ConsumedFoodsWitFood(
                food: row.readTable(foods),
                consumedFood: row.readTable(consumedFoods));
          }).fold(
              0,
              (previousValue, element) =>
                  previousValue + element.consumedCalories());
        });
  }

  Stream<int> watchTotalDailyCalorie(DateTime selectDate) {
    return (select(consumedFoods)..where((a) => a.date.equals(selectDate)))
        .join([leftOuterJoin(foods, foods.id.equalsExp(consumedFoods.food))])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return ConsumedFoodsWitFood(
                food: row.readTable(foods),
                consumedFood: row.readTable(consumedFoods));
          }).fold(
              0,
              (previousValue, element) =>
                  previousValue + element.consumedCalories());
        });
  }

  Future deleteFood(Food entry) {
    return delete(foods).delete(entry);
  }

  // Because we want to have only one objective per day (at most).
  // On inserting, if the date already exists, we replace the previous row.
  Future<void> createOrUpdateObjective(Objective entity) {
    return into(objectives).insertOnConflictUpdate(entity);
  }

  /// It should not be possible to modify an objectives, it is only possible to add new objectives.
  /// It is only possible to modify the objective of the current day.
  /// And only one objective is allowed per [date].
  /// To get the objectives of a special [date], I get all objectives that are older than the given [date].
  /// Then, I get the newest.
  /// In other words, the objective of [date] is the lastly modified objective before this [date],
  /// or if it exists the objective of this [date].
  /*getObjective(DateTime _date) {
    return (select(objectives)
          ..where((tbl) {
            final value = tbl.date;
            // Expression<DateTime> date =  Expression<DateTime>(_date);
            return value.isSmallerOrEqualValue(_date);
          })
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .getSingle();
  }
  */

  getObjective(DateTime _date) {
    return (select(objectives)
          ..where((tbl) {
            final value = tbl.date;
            // Expression<DateTime> date =  Expression<DateTime>(_date);
            return value.equals(_date);
          }))
        .getSingle();
  }

  watchObjective(DateTime _date) {
    return (select(objectives)
          ..where((tbl) {
            final value = tbl.date;
            // Expression<DateTime> date =  Expression<DateTime>(_date);
            return value.equals(_date);
          }))
        .watchSingle();
  }

  /*
  Stream<Objective> watchObjective(DateTime _date) {
    return (select(objectives)
          ..where((tbl) {
            final value = tbl.date;
            // Expression<DateTime> date =  Expression<DateTime>(_date);
            return value.isSmallerOrEqualValue(_date);
          })
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .watchSingle();
  }
  */

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
      debugPrint("Create all tables");
      // Custom statement to enable primary key
      customStatement('PRAGMA foreign_keys = ON;');
      return m.createAll();
    }, beforeOpen: (openingDetails) async {
      if (true /* or some other flag */) {
        final m = createMigrator(); // changed to this
        for (final table in allTables) {
          // debugPrint("remove table: ${table.actualTableName}");
          // await m.deleteTable(table.actualTableName);
          // await m.createTable(table);
        }
      }
    });
  }
}
