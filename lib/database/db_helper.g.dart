// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FoodModel extends DataClass implements Insertable<FoodModel> {
  final int id;
  final String name;
  final int portion;
  final int calorie;
  final String unit;
  final String source;
  final String barcode;
  FoodModel(
      {@required this.id,
      @required this.name,
      @required this.portion,
      @required this.calorie,
      @required this.unit,
      this.source,
      this.barcode});
  factory FoodModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return FoodModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      portion:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}portion']),
      calorie:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}calorie']),
      unit: stringType.mapFromDatabaseResponse(data['${effectivePrefix}unit']),
      source:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}source']),
      barcode:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}barcode']),
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
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    return map;
  }

  FoodModelsCompanion toCompanion(bool nullToAbsent) {
    return FoodModelsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      portion: portion == null && nullToAbsent
          ? const Value.absent()
          : Value(portion),
      calorie: calorie == null && nullToAbsent
          ? const Value.absent()
          : Value(calorie),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
    );
  }

  factory FoodModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      portion: serializer.fromJson<int>(json['portion']),
      calorie: serializer.fromJson<int>(json['calorie']),
      unit: serializer.fromJson<String>(json['unit']),
      source: serializer.fromJson<String>(json['source']),
      barcode: serializer.fromJson<String>(json['barcode']),
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
      'source': serializer.toJson<String>(source),
      'barcode': serializer.toJson<String>(barcode),
    };
  }

  FoodModel copyWith(
          {int id,
          String name,
          int portion,
          int calorie,
          String unit,
          String source,
          String barcode}) =>
      FoodModel(
        id: id ?? this.id,
        name: name ?? this.name,
        portion: portion ?? this.portion,
        calorie: calorie ?? this.calorie,
        unit: unit ?? this.unit,
        source: source ?? this.source,
        barcode: barcode ?? this.barcode,
      );
  @override
  String toString() {
    return (StringBuffer('FoodModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('calorie: $calorie, ')
          ..write('unit: $unit, ')
          ..write('source: $source, ')
          ..write('barcode: $barcode')
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
                  calorie.hashCode,
                  $mrjc(unit.hashCode,
                      $mrjc(source.hashCode, barcode.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FoodModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.portion == this.portion &&
          other.calorie == this.calorie &&
          other.unit == this.unit &&
          other.source == this.source &&
          other.barcode == this.barcode);
}

class FoodModelsCompanion extends UpdateCompanion<FoodModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> portion;
  final Value<int> calorie;
  final Value<String> unit;
  final Value<String> source;
  final Value<String> barcode;
  const FoodModelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.portion = const Value.absent(),
    this.calorie = const Value.absent(),
    this.unit = const Value.absent(),
    this.source = const Value.absent(),
    this.barcode = const Value.absent(),
  });
  FoodModelsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int portion,
    @required int calorie,
    @required String unit,
    this.source = const Value.absent(),
    this.barcode = const Value.absent(),
  })  : name = Value(name),
        portion = Value(portion),
        calorie = Value(calorie),
        unit = Value(unit);
  static Insertable<FoodModel> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> portion,
    Expression<int> calorie,
    Expression<String> unit,
    Expression<String> source,
    Expression<String> barcode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (portion != null) 'portion': portion,
      if (calorie != null) 'calorie': calorie,
      if (unit != null) 'unit': unit,
      if (source != null) 'source': source,
      if (barcode != null) 'barcode': barcode,
    });
  }

  FoodModelsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> portion,
      Value<int> calorie,
      Value<String> unit,
      Value<String> source,
      Value<String> barcode}) {
    return FoodModelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      portion: portion ?? this.portion,
      calorie: calorie ?? this.calorie,
      unit: unit ?? this.unit,
      source: source ?? this.source,
      barcode: barcode ?? this.barcode,
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
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodModelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('calorie: $calorie, ')
          ..write('unit: $unit, ')
          ..write('source: $source, ')
          ..write('barcode: $barcode')
          ..write(')'))
        .toString();
  }
}

class $FoodModelsTable extends FoodModels
    with TableInfo<$FoodModelsTable, FoodModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodModelsTable(this._db, [this._alias]);
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

  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  GeneratedTextColumn _source;
  @override
  GeneratedTextColumn get source => _source ??= _constructSource();
  GeneratedTextColumn _constructSource() {
    return GeneratedTextColumn(
      'source',
      $tableName,
      true,
    );
  }

  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  GeneratedTextColumn _barcode;
  @override
  GeneratedTextColumn get barcode => _barcode ??= _constructBarcode();
  GeneratedTextColumn _constructBarcode() {
    return GeneratedTextColumn(
      'barcode',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, portion, calorie, unit, source, barcode];
  @override
  $FoodModelsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'food_models';
  @override
  final String actualTableName = 'food_models';
  @override
  VerificationContext validateIntegrity(Insertable<FoodModel> instance,
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
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source'], _sourceMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode'], _barcodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FoodModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodModelsTable createAlias(String alias) {
    return $FoodModelsTable(_db, alias);
  }
}

class ConsumedFood extends DataClass implements Insertable<ConsumedFood> {
  final int id;
  final DateTime date;
  final int quantity;
  final String mealType;
  final String name;
  final int portion;
  final int calorie;
  final String unit;
  ConsumedFood(
      {@required this.id,
      @required this.date,
      @required this.quantity,
      @required this.mealType,
      @required this.name,
      @required this.portion,
      @required this.calorie,
      @required this.unit});
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
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      mealType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_type']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      portion:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}portion']),
      calorie:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}calorie']),
      unit: stringType.mapFromDatabaseResponse(data['${effectivePrefix}unit']),
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
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || mealType != null) {
      map['meal_type'] = Variable<String>(mealType);
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
    return map;
  }

  ConsumedFoodsCompanion toCompanion(bool nullToAbsent) {
    return ConsumedFoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      mealType: mealType == null && nullToAbsent
          ? const Value.absent()
          : Value(mealType),
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

  factory ConsumedFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ConsumedFood(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      quantity: serializer.fromJson<int>(json['quantity']),
      mealType: serializer.fromJson<String>(json['mealType']),
      name: serializer.fromJson<String>(json['name']),
      portion: serializer.fromJson<int>(json['portion']),
      calorie: serializer.fromJson<int>(json['calorie']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'quantity': serializer.toJson<int>(quantity),
      'mealType': serializer.toJson<String>(mealType),
      'name': serializer.toJson<String>(name),
      'portion': serializer.toJson<int>(portion),
      'calorie': serializer.toJson<int>(calorie),
      'unit': serializer.toJson<String>(unit),
    };
  }

  ConsumedFood copyWith(
          {int id,
          DateTime date,
          int quantity,
          String mealType,
          String name,
          int portion,
          int calorie,
          String unit}) =>
      ConsumedFood(
        id: id ?? this.id,
        date: date ?? this.date,
        quantity: quantity ?? this.quantity,
        mealType: mealType ?? this.mealType,
        name: name ?? this.name,
        portion: portion ?? this.portion,
        calorie: calorie ?? this.calorie,
        unit: unit ?? this.unit,
      );
  @override
  String toString() {
    return (StringBuffer('ConsumedFood(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('quantity: $quantity, ')
          ..write('mealType: $mealType, ')
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
      $mrjc(
          date.hashCode,
          $mrjc(
              quantity.hashCode,
              $mrjc(
                  mealType.hashCode,
                  $mrjc(
                      name.hashCode,
                      $mrjc(portion.hashCode,
                          $mrjc(calorie.hashCode, unit.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ConsumedFood &&
          other.id == this.id &&
          other.date == this.date &&
          other.quantity == this.quantity &&
          other.mealType == this.mealType &&
          other.name == this.name &&
          other.portion == this.portion &&
          other.calorie == this.calorie &&
          other.unit == this.unit);
}

class ConsumedFoodsCompanion extends UpdateCompanion<ConsumedFood> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> quantity;
  final Value<String> mealType;
  final Value<String> name;
  final Value<int> portion;
  final Value<int> calorie;
  final Value<String> unit;
  const ConsumedFoodsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.quantity = const Value.absent(),
    this.mealType = const Value.absent(),
    this.name = const Value.absent(),
    this.portion = const Value.absent(),
    this.calorie = const Value.absent(),
    this.unit = const Value.absent(),
  });
  ConsumedFoodsCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required int quantity,
    @required String mealType,
    @required String name,
    @required int portion,
    @required int calorie,
    @required String unit,
  })  : date = Value(date),
        quantity = Value(quantity),
        mealType = Value(mealType),
        name = Value(name),
        portion = Value(portion),
        calorie = Value(calorie),
        unit = Value(unit);
  static Insertable<ConsumedFood> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<int> quantity,
    Expression<String> mealType,
    Expression<String> name,
    Expression<int> portion,
    Expression<int> calorie,
    Expression<String> unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (quantity != null) 'quantity': quantity,
      if (mealType != null) 'meal_type': mealType,
      if (name != null) 'name': name,
      if (portion != null) 'portion': portion,
      if (calorie != null) 'calorie': calorie,
      if (unit != null) 'unit': unit,
    });
  }

  ConsumedFoodsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<int> quantity,
      Value<String> mealType,
      Value<String> name,
      Value<int> portion,
      Value<int> calorie,
      Value<String> unit}) {
    return ConsumedFoodsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      quantity: quantity ?? this.quantity,
      mealType: mealType ?? this.mealType,
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
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsumedFoodsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('quantity: $quantity, ')
          ..write('mealType: $mealType, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('calorie: $calorie, ')
          ..write('unit: $unit')
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

  @override
  List<GeneratedColumn> get $columns =>
      [id, date, quantity, mealType, name, portion, calorie, unit];
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
  $FoodModelsTable _foodModels;
  $FoodModelsTable get foodModels => _foodModels ??= $FoodModelsTable(this);
  $ConsumedFoodsTable _consumedFoods;
  $ConsumedFoodsTable get consumedFoods =>
      _consumedFoods ??= $ConsumedFoodsTable(this);
  $ObjectivesTable _objectives;
  $ObjectivesTable get objectives => _objectives ??= $ObjectivesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [foodModels, consumedFoods, objectives];
}
