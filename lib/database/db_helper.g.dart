// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  final double portion;
  final double calorie;
  final String unit;
  Food(
      {@required this.id,
      @required this.name,
      @required this.portion,
      @required this.calorie,
      @required this.unit});
  factory Food.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Food(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      portion:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}portion']),
      calorie:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}calorie']),
      unit: stringType.mapFromDatabaseResponse(data['${effectivePrefix}unit']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || portion != null) {
      map['portion'] = Variable<double>(portion);
    }
    if (!nullToAbsent || calorie != null) {
      map['calorie'] = Variable<double>(calorie);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      portion: portion == null && nullToAbsent
          ? const Value.absent()
          : Value(portion),
      calorie: calorie == null && nullToAbsent
          ? const Value.absent()
          : Value(calorie),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      portion: serializer.fromJson<double>(json['portion']),
      calorie: serializer.fromJson<double>(json['calorie']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'portion': serializer.toJson<double>(portion),
      'calorie': serializer.toJson<double>(calorie),
      'unit': serializer.toJson<String>(unit),
    };
  }

  Food copyWith(
          {int id, String name, double portion, double calorie, String unit}) =>
      Food(
        id: id ?? this.id,
        name: name ?? this.name,
        portion: portion ?? this.portion,
        calorie: calorie ?? this.calorie,
        unit: unit ?? this.unit,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('calorie: $calorie, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(portion.hashCode, $mrjc(calorie.hashCode, unit.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.portion == this.portion &&
          other.calorie == this.calorie &&
          other.unit == this.unit);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> portion;
  final Value<double> calorie;
  final Value<String> unit;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.portion = const Value.absent(),
    this.calorie = const Value.absent(),
    this.unit = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required double portion,
    @required double calorie,
    @required String unit,
  })  : name = Value(name),
        portion = Value(portion),
        calorie = Value(calorie),
        unit = Value(unit);
  static Insertable<Food> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<double> portion,
    Expression<double> calorie,
    Expression<String> unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (portion != null) 'portion': portion,
      if (calorie != null) 'calorie': calorie,
      if (unit != null) 'unit': unit,
    });
  }

  FoodsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<double> portion,
      Value<double> calorie,
      Value<String> unit}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      portion: portion ?? this.portion,
      calorie: calorie ?? this.calorie,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (portion.present) {
      map['portion'] = Variable<double>(portion.value);
    }
    if (calorie.present) {
      map['calorie'] = Variable<double>(calorie.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('calorie: $calorie, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  final VerificationMeta _portionMeta = const VerificationMeta('portion');
  GeneratedRealColumn _portion;
  @override
  GeneratedRealColumn get portion => _portion ??= _constructPortion();
  GeneratedRealColumn _constructPortion() {
    return GeneratedRealColumn(
      'portion',
      $tableName,
      false,
    );
  }

  final VerificationMeta _calorieMeta = const VerificationMeta('calorie');
  GeneratedRealColumn _calorie;
  @override
  GeneratedRealColumn get calorie => _calorie ??= _constructCalorie();
  GeneratedRealColumn _constructCalorie() {
    return GeneratedRealColumn(
      'calorie',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  GeneratedTextColumn _unit;
  @override
  GeneratedTextColumn get unit => _unit ??= _constructUnit();
  GeneratedTextColumn _constructUnit() {
    return GeneratedTextColumn(
      'unit',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, portion, calorie, unit];
  @override
  $FoodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'foods';
  @override
  final String actualTableName = 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('portion')) {
      context.handle(_portionMeta,
          portion.isAcceptableOrUnknown(data['portion'], _portionMeta));
    } else if (isInserting) {
      context.missing(_portionMeta);
    }
    if (data.containsKey('calorie')) {
      context.handle(_calorieMeta,
          calorie.isAcceptableOrUnknown(data['calorie'], _calorieMeta));
    } else if (isInserting) {
      context.missing(_calorieMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit'], _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Food.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(_db, alias);
  }
}

class ConsumedFood extends DataClass implements Insertable<ConsumedFood> {
  final int id;
  final DateTime date;
  final int food;
  final double quantity;
  final String mealType;
  ConsumedFood(
      {@required this.id,
      @required this.date,
      @required this.food,
      @required this.quantity,
      @required this.mealType});
  factory ConsumedFood.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    return ConsumedFood(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      food: intType.mapFromDatabaseResponse(data['${effectivePrefix}food']),
      quantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      mealType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || food != null) {
      map['food'] = Variable<int>(food);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || mealType != null) {
      map['meal_type'] = Variable<String>(mealType);
    }
    return map;
  }

  ConsumedFoodsCompanion toCompanion(bool nullToAbsent) {
    return ConsumedFoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      food: food == null && nullToAbsent ? const Value.absent() : Value(food),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      mealType: mealType == null && nullToAbsent
          ? const Value.absent()
          : Value(mealType),
    );
  }

  factory ConsumedFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ConsumedFood(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      food: serializer.fromJson<int>(json['food']),
      quantity: serializer.fromJson<double>(json['quantity']),
      mealType: serializer.fromJson<String>(json['mealType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'food': serializer.toJson<int>(food),
      'quantity': serializer.toJson<double>(quantity),
      'mealType': serializer.toJson<String>(mealType),
    };
  }

  ConsumedFood copyWith(
          {int id,
          DateTime date,
          int food,
          double quantity,
          String mealType}) =>
      ConsumedFood(
        id: id ?? this.id,
        date: date ?? this.date,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        mealType: mealType ?? this.mealType,
      );
  @override
  String toString() {
    return (StringBuffer('ConsumedFood(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('food: $food, ')
          ..write('quantity: $quantity, ')
          ..write('mealType: $mealType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(date.hashCode,
          $mrjc(food.hashCode, $mrjc(quantity.hashCode, mealType.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ConsumedFood &&
          other.id == this.id &&
          other.date == this.date &&
          other.food == this.food &&
          other.quantity == this.quantity &&
          other.mealType == this.mealType);
}

class ConsumedFoodsCompanion extends UpdateCompanion<ConsumedFood> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> food;
  final Value<double> quantity;
  final Value<String> mealType;
  const ConsumedFoodsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.food = const Value.absent(),
    this.quantity = const Value.absent(),
    this.mealType = const Value.absent(),
  });
  ConsumedFoodsCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required int food,
    @required double quantity,
    @required String mealType,
  })  : date = Value(date),
        food = Value(food),
        quantity = Value(quantity),
        mealType = Value(mealType);
  static Insertable<ConsumedFood> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<int> food,
    Expression<double> quantity,
    Expression<String> mealType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (food != null) 'food': food,
      if (quantity != null) 'quantity': quantity,
      if (mealType != null) 'meal_type': mealType,
    });
  }

  ConsumedFoodsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<int> food,
      Value<double> quantity,
      Value<String> mealType}) {
    return ConsumedFoodsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      mealType: mealType ?? this.mealType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (food.present) {
      map['food'] = Variable<int>(food.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsumedFoodsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('food: $food, ')
          ..write('quantity: $quantity, ')
          ..write('mealType: $mealType')
          ..write(')'))
        .toString();
  }
}

class $ConsumedFoodsTable extends ConsumedFoods
    with TableInfo<$ConsumedFoodsTable, ConsumedFood> {
  final GeneratedDatabase _db;
  final String _alias;
  $ConsumedFoodsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _foodMeta = const VerificationMeta('food');
  GeneratedIntColumn _food;
  @override
  GeneratedIntColumn get food => _food ??= _constructFood();
  GeneratedIntColumn _constructFood() {
    return GeneratedIntColumn(
      'food',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedRealColumn _quantity;
  @override
  GeneratedRealColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedRealColumn _constructQuantity() {
    return GeneratedRealColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mealTypeMeta = const VerificationMeta('mealType');
  GeneratedTextColumn _mealType;
  @override
  GeneratedTextColumn get mealType => _mealType ??= _constructMealType();
  GeneratedTextColumn _constructMealType() {
    return GeneratedTextColumn(
      'meal_type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date, food, quantity, mealType];
  @override
  $ConsumedFoodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'consumed_foods';
  @override
  final String actualTableName = 'consumed_foods';
  @override
  VerificationContext validateIntegrity(Insertable<ConsumedFood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('food')) {
      context.handle(
          _foodMeta, food.isAcceptableOrUnknown(data['food'], _foodMeta));
    } else if (isInserting) {
      context.missing(_foodMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('meal_type')) {
      context.handle(_mealTypeMeta,
          mealType.isAcceptableOrUnknown(data['meal_type'], _mealTypeMeta));
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConsumedFood map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ConsumedFood.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ConsumedFoodsTable createAlias(String alias) {
    return $ConsumedFoodsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FoodsTable _foods;
  $FoodsTable get foods => _foods ??= $FoodsTable(this);
  $ConsumedFoodsTable _consumedFoods;
  $ConsumedFoodsTable get consumedFoods =>
      _consumedFoods ??= $ConsumedFoodsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foods, consumedFoods];
}
