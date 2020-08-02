// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  final int portion;
  final int calorie;
  final String unit;
  final bool visible;
  Food(
      {@required this.id,
      @required this.name,
      @required this.portion,
      @required this.calorie,
      @required this.unit,
      @required this.visible});
  factory Food.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Food(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      portion:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}portion']),
      calorie:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}calorie']),
      unit: stringType.mapFromDatabaseResponse(data['${effectivePrefix}unit']),
      visible:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}visible']),
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
      map['portion'] = Variable<int>(portion);
    }
    if (!nullToAbsent || calorie != null) {
      map['calorie'] = Variable<int>(calorie);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || visible != null) {
      map['visible'] = Variable<bool>(visible);
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
      visible: visible == null && nullToAbsent
          ? const Value.absent()
          : Value(visible),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      portion: serializer.fromJson<int>(json['portion']),
      calorie: serializer.fromJson<int>(json['calorie']),
      unit: serializer.fromJson<String>(json['unit']),
      visible: serializer.fromJson<bool>(json['visible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'portion': serializer.toJson<int>(portion),
      'calorie': serializer.toJson<int>(calorie),
      'unit': serializer.toJson<String>(unit),
      'visible': serializer.toJson<bool>(visible),
    };
  }

  Food copyWith(
          {int id,
          String name,
          int portion,
          int calorie,
          String unit,
          bool visible}) =>
      Food(
        id: id ?? this.id,
        name: name ?? this.name,
        portion: portion ?? this.portion,
        calorie: calorie ?? this.calorie,
        unit: unit ?? this.unit,
        visible: visible ?? this.visible,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('calorie: $calorie, ')
          ..write('unit: $unit, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              portion.hashCode,
              $mrjc(
                  calorie.hashCode, $mrjc(unit.hashCode, visible.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.portion == this.portion &&
          other.calorie == this.calorie &&
          other.unit == this.unit &&
          other.visible == this.visible);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> portion;
  final Value<int> calorie;
  final Value<String> unit;
  final Value<bool> visible;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.portion = const Value.absent(),
    this.calorie = const Value.absent(),
    this.unit = const Value.absent(),
    this.visible = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int portion,
    @required int calorie,
    @required String unit,
    @required bool visible,
  })  : name = Value(name),
        portion = Value(portion),
        calorie = Value(calorie),
        unit = Value(unit),
        visible = Value(visible);
  static Insertable<Food> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> portion,
    Expression<int> calorie,
    Expression<String> unit,
    Expression<bool> visible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (portion != null) 'portion': portion,
      if (calorie != null) 'calorie': calorie,
      if (unit != null) 'unit': unit,
      if (visible != null) 'visible': visible,
    });
  }

  FoodsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> portion,
      Value<int> calorie,
      Value<String> unit,
      Value<bool> visible}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      portion: portion ?? this.portion,
      calorie: calorie ?? this.calorie,
      unit: unit ?? this.unit,
      visible: visible ?? this.visible,
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
      map['portion'] = Variable<int>(portion.value);
    }
    if (calorie.present) {
      map['calorie'] = Variable<int>(calorie.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
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
          ..write('unit: $unit, ')
          ..write('visible: $visible')
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
  GeneratedIntColumn _portion;
  @override
  GeneratedIntColumn get portion => _portion ??= _constructPortion();
  GeneratedIntColumn _constructPortion() {
    return GeneratedIntColumn(
      'portion',
      $tableName,
      false,
    );
  }

  final VerificationMeta _calorieMeta = const VerificationMeta('calorie');
  GeneratedIntColumn _calorie;
  @override
  GeneratedIntColumn get calorie => _calorie ??= _constructCalorie();
  GeneratedIntColumn _constructCalorie() {
    return GeneratedIntColumn(
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

  final VerificationMeta _visibleMeta = const VerificationMeta('visible');
  GeneratedBoolColumn _visible;
  @override
  GeneratedBoolColumn get visible => _visible ??= _constructVisible();
  GeneratedBoolColumn _constructVisible() {
    return GeneratedBoolColumn(
      'visible',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, portion, calorie, unit, visible];
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
    if (data.containsKey('visible')) {
      context.handle(_visibleMeta,
          visible.isAcceptableOrUnknown(data['visible'], _visibleMeta));
    } else if (isInserting) {
      context.missing(_visibleMeta);
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
  final int quantity;
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
    final stringType = db.typeSystem.forDartType<String>();
    return ConsumedFood(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      food: intType.mapFromDatabaseResponse(data['${effectivePrefix}food']),
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
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
      map['quantity'] = Variable<int>(quantity);
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
      quantity: serializer.fromJson<int>(json['quantity']),
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
      'quantity': serializer.toJson<int>(quantity),
      'mealType': serializer.toJson<String>(mealType),
    };
  }

  ConsumedFood copyWith(
          {int id, DateTime date, int food, int quantity, String mealType}) =>
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
  final Value<int> quantity;
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
    @required int quantity,
    @required String mealType,
  })  : date = Value(date),
        food = Value(food),
        quantity = Value(quantity),
        mealType = Value(mealType);
  static Insertable<ConsumedFood> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<int> food,
    Expression<int> quantity,
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
      Value<int> quantity,
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
      map['quantity'] = Variable<int>(quantity.value);
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
  GeneratedIntColumn _quantity;
  @override
  GeneratedIntColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedIntColumn _constructQuantity() {
    return GeneratedIntColumn(
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

class Objective extends DataClass implements Insertable<Objective> {
  final int objective;
  final DateTime date;
  Objective({@required this.objective, @required this.date});
  factory Objective.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Objective(
      objective:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}objective']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || objective != null) {
      map['objective'] = Variable<int>(objective);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  ObjectivesCompanion toCompanion(bool nullToAbsent) {
    return ObjectivesCompanion(
      objective: objective == null && nullToAbsent
          ? const Value.absent()
          : Value(objective),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Objective.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Objective(
      objective: serializer.fromJson<int>(json['objective']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objective': serializer.toJson<int>(objective),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Objective copyWith({int objective, DateTime date}) => Objective(
        objective: objective ?? this.objective,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Objective(')
          ..write('objective: $objective, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(objective.hashCode, date.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Objective &&
          other.objective == this.objective &&
          other.date == this.date);
}

class ObjectivesCompanion extends UpdateCompanion<Objective> {
  final Value<int> objective;
  final Value<DateTime> date;
  const ObjectivesCompanion({
    this.objective = const Value.absent(),
    this.date = const Value.absent(),
  });
  ObjectivesCompanion.insert({
    @required int objective,
    @required DateTime date,
  })  : objective = Value(objective),
        date = Value(date);
  static Insertable<Objective> custom({
    Expression<int> objective,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (objective != null) 'objective': objective,
      if (date != null) 'date': date,
    });
  }

  ObjectivesCompanion copyWith({Value<int> objective, Value<DateTime> date}) {
    return ObjectivesCompanion(
      objective: objective ?? this.objective,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objective.present) {
      map['objective'] = Variable<int>(objective.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObjectivesCompanion(')
          ..write('objective: $objective, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $ObjectivesTable extends Objectives
    with TableInfo<$ObjectivesTable, Objective> {
  final GeneratedDatabase _db;
  final String _alias;
  $ObjectivesTable(this._db, [this._alias]);
  final VerificationMeta _objectiveMeta = const VerificationMeta('objective');
  GeneratedIntColumn _objective;
  @override
  GeneratedIntColumn get objective => _objective ??= _constructObjective();
  GeneratedIntColumn _constructObjective() {
    return GeneratedIntColumn(
      'objective',
      $tableName,
      false,
    );
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

  @override
  List<GeneratedColumn> get $columns => [objective, date];
  @override
  $ObjectivesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'objectives';
  @override
  final String actualTableName = 'objectives';
  @override
  VerificationContext validateIntegrity(Insertable<Objective> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('objective')) {
      context.handle(_objectiveMeta,
          objective.isAcceptableOrUnknown(data['objective'], _objectiveMeta));
    } else if (isInserting) {
      context.missing(_objectiveMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Objective map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Objective.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ObjectivesTable createAlias(String alias) {
    return $ObjectivesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FoodsTable _foods;
  $FoodsTable get foods => _foods ??= $FoodsTable(this);
  $ConsumedFoodsTable _consumedFoods;
  $ConsumedFoodsTable get consumedFoods =>
      _consumedFoods ??= $ConsumedFoodsTable(this);
  $ObjectivesTable _objectives;
  $ObjectivesTable get objectives => _objectives ??= $ObjectivesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [foods, consumedFoods, objectives];
}
