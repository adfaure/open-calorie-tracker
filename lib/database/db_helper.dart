// These imports are only needed to open the database
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'db_helper.g.dart';

// This will generate a table called "Food" for us. The rows of that table will
// be represented by a class called "Food".
class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
  RealColumn get portion => real()();
  RealColumn get calorie => real()();
  TextColumn get unit => text()();
}

class ConsumedFood extends Table {
  DateTimeColumn get date => dateTime()();
  IntColumn get food => integer().autoIncrement()();
  RealColumn get consumedPortion => real()();
  TextColumn get mealType => text()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(
  tables: [Foods],
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

  // loads all todo entries
  Future<List<Food>> get allFoodEntries => select(foods).get();

  // The stream will automatically emit new items whenever the underlying data changes.
  Stream<List<Food>> watchEntriesInFoods() {
    return (select(foods)).watch();
  }

  Future deleteFood(Food entry) {
    return delete(foods).delete(entry);
  }
}
