// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FoodModel extends DataClass implements Insertable<FoodModel> {
  final int id;
  final bool visible;
  final String name;
  final int portion;
  final String unit;
  final int serving;
  final String servingUnit;
  final int calorie;
  final String source;
  final String barcode;
  final int lipids;
  final int carbohydrates;
  final int proteins;
  FoodModel(
      {@required this.id,
      @required this.visible,
      @required this.name,
      @required this.portion,
      @required this.unit,
      this.serving,
      this.servingUnit,
      @required this.calorie,
      this.source,
      this.barcode,
      this.lipids,
      this.carbohydrates,
      this.proteins});
  factory FoodModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return FoodModel(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      visible: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}visible']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      portion: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}portion']),
      unit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit']),
      serving: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serving']),
      servingUnit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serving_unit']),
      calorie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}calorie']),
      source: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}source']),
      barcode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}barcode']),
      lipids: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lipids']),
      carbohydrates: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carbohydrates']),
      proteins: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}proteins']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || visible != null) {
      map['visible'] = Variable<bool>(visible);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || portion != null) {
      map['portion'] = Variable<int>(portion);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || serving != null) {
      map['serving'] = Variable<int>(serving);
    }
    if (!nullToAbsent || servingUnit != null) {
      map['serving_unit'] = Variable<String>(servingUnit);
    }
    if (!nullToAbsent || calorie != null) {
      map['calorie'] = Variable<int>(calorie);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || lipids != null) {
      map['lipids'] = Variable<int>(lipids);
    }
    if (!nullToAbsent || carbohydrates != null) {
      map['carbohydrates'] = Variable<int>(carbohydrates);
    }
    if (!nullToAbsent || proteins != null) {
      map['proteins'] = Variable<int>(proteins);
    }
    return map;
  }

  FoodModelsCompanion toCompanion(bool nullToAbsent) {
    return FoodModelsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      visible: visible == null && nullToAbsent
          ? const Value.absent()
          : Value(visible),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      portion: portion == null && nullToAbsent
          ? const Value.absent()
          : Value(portion),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      serving: serving == null && nullToAbsent
          ? const Value.absent()
          : Value(serving),
      servingUnit: servingUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(servingUnit),
      calorie: calorie == null && nullToAbsent
          ? const Value.absent()
          : Value(calorie),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      lipids:
          lipids == null && nullToAbsent ? const Value.absent() : Value(lipids),
      carbohydrates: carbohydrates == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrates),
      proteins: proteins == null && nullToAbsent
          ? const Value.absent()
          : Value(proteins),
    );
  }

  factory FoodModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodModel(
      id: serializer.fromJson<int>(json['id']),
      visible: serializer.fromJson<bool>(json['visible']),
      name: serializer.fromJson<String>(json['name']),
      portion: serializer.fromJson<int>(json['portion']),
      unit: serializer.fromJson<String>(json['unit']),
      serving: serializer.fromJson<int>(json['serving']),
      servingUnit: serializer.fromJson<String>(json['servingUnit']),
      calorie: serializer.fromJson<int>(json['calorie']),
      source: serializer.fromJson<String>(json['source']),
      barcode: serializer.fromJson<String>(json['barcode']),
      lipids: serializer.fromJson<int>(json['lipids']),
      carbohydrates: serializer.fromJson<int>(json['carbohydrates']),
      proteins: serializer.fromJson<int>(json['proteins']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'visible': serializer.toJson<bool>(visible),
      'name': serializer.toJson<String>(name),
      'portion': serializer.toJson<int>(portion),
      'unit': serializer.toJson<String>(unit),
      'serving': serializer.toJson<int>(serving),
      'servingUnit': serializer.toJson<String>(servingUnit),
      'calorie': serializer.toJson<int>(calorie),
      'source': serializer.toJson<String>(source),
      'barcode': serializer.toJson<String>(barcode),
      'lipids': serializer.toJson<int>(lipids),
      'carbohydrates': serializer.toJson<int>(carbohydrates),
      'proteins': serializer.toJson<int>(proteins),
    };
  }

  FoodModel copyWith(
          {int id,
          bool visible,
          String name,
          int portion,
          String unit,
          int serving,
          String servingUnit,
          int calorie,
          String source,
          String barcode,
          int lipids,
          int carbohydrates,
          int proteins}) =>
      FoodModel(
        id: id ?? this.id,
        visible: visible ?? this.visible,
        name: name ?? this.name,
        portion: portion ?? this.portion,
        unit: unit ?? this.unit,
        serving: serving ?? this.serving,
        servingUnit: servingUnit ?? this.servingUnit,
        calorie: calorie ?? this.calorie,
        source: source ?? this.source,
        barcode: barcode ?? this.barcode,
        lipids: lipids ?? this.lipids,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        proteins: proteins ?? this.proteins,
      );
  @override
  String toString() {
    return (StringBuffer('FoodModel(')
          ..write('id: $id, ')
          ..write('visible: $visible, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('unit: $unit, ')
          ..write('serving: $serving, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('calorie: $calorie, ')
          ..write('source: $source, ')
          ..write('barcode: $barcode, ')
          ..write('lipids: $lipids, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('proteins: $proteins')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, visible, name, portion, unit, serving,
      servingUnit, calorie, source, barcode, lipids, carbohydrates, proteins);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodModel &&
          other.id == this.id &&
          other.visible == this.visible &&
          other.name == this.name &&
          other.portion == this.portion &&
          other.unit == this.unit &&
          other.serving == this.serving &&
          other.servingUnit == this.servingUnit &&
          other.calorie == this.calorie &&
          other.source == this.source &&
          other.barcode == this.barcode &&
          other.lipids == this.lipids &&
          other.carbohydrates == this.carbohydrates &&
          other.proteins == this.proteins);
}

class FoodModelsCompanion extends UpdateCompanion<FoodModel> {
  final Value<int> id;
  final Value<bool> visible;
  final Value<String> name;
  final Value<int> portion;
  final Value<String> unit;
  final Value<int> serving;
  final Value<String> servingUnit;
  final Value<int> calorie;
  final Value<String> source;
  final Value<String> barcode;
  final Value<int> lipids;
  final Value<int> carbohydrates;
  final Value<int> proteins;
  const FoodModelsCompanion({
    this.id = const Value.absent(),
    this.visible = const Value.absent(),
    this.name = const Value.absent(),
    this.portion = const Value.absent(),
    this.unit = const Value.absent(),
    this.serving = const Value.absent(),
    this.servingUnit = const Value.absent(),
    this.calorie = const Value.absent(),
    this.source = const Value.absent(),
    this.barcode = const Value.absent(),
    this.lipids = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.proteins = const Value.absent(),
  });
  FoodModelsCompanion.insert({
    this.id = const Value.absent(),
    this.visible = const Value.absent(),
    @required String name,
    @required int portion,
    @required String unit,
    this.serving = const Value.absent(),
    this.servingUnit = const Value.absent(),
    @required int calorie,
    this.source = const Value.absent(),
    this.barcode = const Value.absent(),
    this.lipids = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.proteins = const Value.absent(),
  })  : name = Value(name),
        portion = Value(portion),
        unit = Value(unit),
        calorie = Value(calorie);
  static Insertable<FoodModel> custom({
    Expression<int> id,
    Expression<bool> visible,
    Expression<String> name,
    Expression<int> portion,
    Expression<String> unit,
    Expression<int> serving,
    Expression<String> servingUnit,
    Expression<int> calorie,
    Expression<String> source,
    Expression<String> barcode,
    Expression<int> lipids,
    Expression<int> carbohydrates,
    Expression<int> proteins,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (visible != null) 'visible': visible,
      if (name != null) 'name': name,
      if (portion != null) 'portion': portion,
      if (unit != null) 'unit': unit,
      if (serving != null) 'serving': serving,
      if (servingUnit != null) 'serving_unit': servingUnit,
      if (calorie != null) 'calorie': calorie,
      if (source != null) 'source': source,
      if (barcode != null) 'barcode': barcode,
      if (lipids != null) 'lipids': lipids,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (proteins != null) 'proteins': proteins,
    });
  }

  FoodModelsCompanion copyWith(
      {Value<int> id,
      Value<bool> visible,
      Value<String> name,
      Value<int> portion,
      Value<String> unit,
      Value<int> serving,
      Value<String> servingUnit,
      Value<int> calorie,
      Value<String> source,
      Value<String> barcode,
      Value<int> lipids,
      Value<int> carbohydrates,
      Value<int> proteins}) {
    return FoodModelsCompanion(
      id: id ?? this.id,
      visible: visible ?? this.visible,
      name: name ?? this.name,
      portion: portion ?? this.portion,
      unit: unit ?? this.unit,
      serving: serving ?? this.serving,
      servingUnit: servingUnit ?? this.servingUnit,
      calorie: calorie ?? this.calorie,
      source: source ?? this.source,
      barcode: barcode ?? this.barcode,
      lipids: lipids ?? this.lipids,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      proteins: proteins ?? this.proteins,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (portion.present) {
      map['portion'] = Variable<int>(portion.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (serving.present) {
      map['serving'] = Variable<int>(serving.value);
    }
    if (servingUnit.present) {
      map['serving_unit'] = Variable<String>(servingUnit.value);
    }
    if (calorie.present) {
      map['calorie'] = Variable<int>(calorie.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (lipids.present) {
      map['lipids'] = Variable<int>(lipids.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<int>(carbohydrates.value);
    }
    if (proteins.present) {
      map['proteins'] = Variable<int>(proteins.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodModelsCompanion(')
          ..write('id: $id, ')
          ..write('visible: $visible, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('unit: $unit, ')
          ..write('serving: $serving, ')
          ..write('servingUnit: $servingUnit, ')
          ..write('calorie: $calorie, ')
          ..write('source: $source, ')
          ..write('barcode: $barcode, ')
          ..write('lipids: $lipids, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('proteins: $proteins')
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
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _visibleMeta = const VerificationMeta('visible');
  GeneratedColumn<bool> _visible;
  @override
  GeneratedColumn<bool> get visible =>
      _visible ??= GeneratedColumn<bool>('visible', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'CHECK (visible IN (0, 1))',
          defaultValue: const Constant(true));
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedColumn<String> _name;
  @override
  GeneratedColumn<String> get name =>
      _name ??= GeneratedColumn<String>('name', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _portionMeta = const VerificationMeta('portion');
  GeneratedColumn<int> _portion;
  @override
  GeneratedColumn<int> get portion =>
      _portion ??= GeneratedColumn<int>('portion', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  GeneratedColumn<String> _unit;
  @override
  GeneratedColumn<String> get unit =>
      _unit ??= GeneratedColumn<String>('unit', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _servingMeta = const VerificationMeta('serving');
  GeneratedColumn<int> _serving;
  @override
  GeneratedColumn<int> get serving =>
      _serving ??= GeneratedColumn<int>('serving', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _servingUnitMeta =
      const VerificationMeta('servingUnit');
  GeneratedColumn<String> _servingUnit;
  @override
  GeneratedColumn<String> get servingUnit => _servingUnit ??=
      GeneratedColumn<String>('serving_unit', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _calorieMeta = const VerificationMeta('calorie');
  GeneratedColumn<int> _calorie;
  @override
  GeneratedColumn<int> get calorie =>
      _calorie ??= GeneratedColumn<int>('calorie', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  GeneratedColumn<String> _source;
  @override
  GeneratedColumn<String> get source =>
      _source ??= GeneratedColumn<String>('source', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  GeneratedColumn<String> _barcode;
  @override
  GeneratedColumn<String> get barcode =>
      _barcode ??= GeneratedColumn<String>('barcode', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _lipidsMeta = const VerificationMeta('lipids');
  GeneratedColumn<int> _lipids;
  @override
  GeneratedColumn<int> get lipids =>
      _lipids ??= GeneratedColumn<int>('lipids', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _carbohydratesMeta =
      const VerificationMeta('carbohydrates');
  GeneratedColumn<int> _carbohydrates;
  @override
  GeneratedColumn<int> get carbohydrates => _carbohydrates ??=
      GeneratedColumn<int>('carbohydrates', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _proteinsMeta = const VerificationMeta('proteins');
  GeneratedColumn<int> _proteins;
  @override
  GeneratedColumn<int> get proteins =>
      _proteins ??= GeneratedColumn<int>('proteins', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        visible,
        name,
        portion,
        unit,
        serving,
        servingUnit,
        calorie,
        source,
        barcode,
        lipids,
        carbohydrates,
        proteins
      ];
  @override
  String get aliasedName => _alias ?? 'food_models';
  @override
  String get actualTableName => 'food_models';
  @override
  VerificationContext validateIntegrity(Insertable<FoodModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('visible')) {
      context.handle(_visibleMeta,
          visible.isAcceptableOrUnknown(data['visible'], _visibleMeta));
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
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit'], _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('serving')) {
      context.handle(_servingMeta,
          serving.isAcceptableOrUnknown(data['serving'], _servingMeta));
    }
    if (data.containsKey('serving_unit')) {
      context.handle(
          _servingUnitMeta,
          servingUnit.isAcceptableOrUnknown(
              data['serving_unit'], _servingUnitMeta));
    }
    if (data.containsKey('calorie')) {
      context.handle(_calorieMeta,
          calorie.isAcceptableOrUnknown(data['calorie'], _calorieMeta));
    } else if (isInserting) {
      context.missing(_calorieMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source'], _sourceMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode'], _barcodeMeta));
    }
    if (data.containsKey('lipids')) {
      context.handle(_lipidsMeta,
          lipids.isAcceptableOrUnknown(data['lipids'], _lipidsMeta));
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
          _carbohydratesMeta,
          carbohydrates.isAcceptableOrUnknown(
              data['carbohydrates'], _carbohydratesMeta));
    }
    if (data.containsKey('proteins')) {
      context.handle(_proteinsMeta,
          proteins.isAcceptableOrUnknown(data['proteins'], _proteinsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodModel map(Map<String, dynamic> data, {String tablePrefix}) {
    return FoodModel.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FoodModelsTable createAlias(String alias) {
    return $FoodModelsTable(_db, alias);
  }
}

class ConsumedFood extends DataClass implements Insertable<ConsumedFood> {
  final int id;
  final String name;
  final DateTime date;
  final String mealType;
  final int quantity;
  final int portion;
  final String unit;
  final int calorie;
  final int lipids;
  final int carbohydrates;
  final int proteins;
  ConsumedFood(
      {@required this.id,
      @required this.name,
      @required this.date,
      @required this.mealType,
      @required this.quantity,
      @required this.portion,
      @required this.unit,
      @required this.calorie,
      this.lipids,
      this.carbohydrates,
      this.proteins});
  factory ConsumedFood.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return ConsumedFood(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
      mealType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_type']),
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      portion: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}portion']),
      unit: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit']),
      calorie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}calorie']),
      lipids: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lipids']),
      carbohydrates: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carbohydrates']),
      proteins: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}proteins']),
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
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || mealType != null) {
      map['meal_type'] = Variable<String>(mealType);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || portion != null) {
      map['portion'] = Variable<int>(portion);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || calorie != null) {
      map['calorie'] = Variable<int>(calorie);
    }
    if (!nullToAbsent || lipids != null) {
      map['lipids'] = Variable<int>(lipids);
    }
    if (!nullToAbsent || carbohydrates != null) {
      map['carbohydrates'] = Variable<int>(carbohydrates);
    }
    if (!nullToAbsent || proteins != null) {
      map['proteins'] = Variable<int>(proteins);
    }
    return map;
  }

  ConsumedFoodsCompanion toCompanion(bool nullToAbsent) {
    return ConsumedFoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      mealType: mealType == null && nullToAbsent
          ? const Value.absent()
          : Value(mealType),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      portion: portion == null && nullToAbsent
          ? const Value.absent()
          : Value(portion),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      calorie: calorie == null && nullToAbsent
          ? const Value.absent()
          : Value(calorie),
      lipids:
          lipids == null && nullToAbsent ? const Value.absent() : Value(lipids),
      carbohydrates: carbohydrates == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrates),
      proteins: proteins == null && nullToAbsent
          ? const Value.absent()
          : Value(proteins),
    );
  }

  factory ConsumedFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ConsumedFood(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<DateTime>(json['date']),
      mealType: serializer.fromJson<String>(json['mealType']),
      quantity: serializer.fromJson<int>(json['quantity']),
      portion: serializer.fromJson<int>(json['portion']),
      unit: serializer.fromJson<String>(json['unit']),
      calorie: serializer.fromJson<int>(json['calorie']),
      lipids: serializer.fromJson<int>(json['lipids']),
      carbohydrates: serializer.fromJson<int>(json['carbohydrates']),
      proteins: serializer.fromJson<int>(json['proteins']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<DateTime>(date),
      'mealType': serializer.toJson<String>(mealType),
      'quantity': serializer.toJson<int>(quantity),
      'portion': serializer.toJson<int>(portion),
      'unit': serializer.toJson<String>(unit),
      'calorie': serializer.toJson<int>(calorie),
      'lipids': serializer.toJson<int>(lipids),
      'carbohydrates': serializer.toJson<int>(carbohydrates),
      'proteins': serializer.toJson<int>(proteins),
    };
  }

  ConsumedFood copyWith(
          {int id,
          String name,
          DateTime date,
          String mealType,
          int quantity,
          int portion,
          String unit,
          int calorie,
          int lipids,
          int carbohydrates,
          int proteins}) =>
      ConsumedFood(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        mealType: mealType ?? this.mealType,
        quantity: quantity ?? this.quantity,
        portion: portion ?? this.portion,
        unit: unit ?? this.unit,
        calorie: calorie ?? this.calorie,
        lipids: lipids ?? this.lipids,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        proteins: proteins ?? this.proteins,
      );
  @override
  String toString() {
    return (StringBuffer('ConsumedFood(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('mealType: $mealType, ')
          ..write('quantity: $quantity, ')
          ..write('portion: $portion, ')
          ..write('unit: $unit, ')
          ..write('calorie: $calorie, ')
          ..write('lipids: $lipids, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('proteins: $proteins')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, date, mealType, quantity, portion,
      unit, calorie, lipids, carbohydrates, proteins);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConsumedFood &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date &&
          other.mealType == this.mealType &&
          other.quantity == this.quantity &&
          other.portion == this.portion &&
          other.unit == this.unit &&
          other.calorie == this.calorie &&
          other.lipids == this.lipids &&
          other.carbohydrates == this.carbohydrates &&
          other.proteins == this.proteins);
}

class ConsumedFoodsCompanion extends UpdateCompanion<ConsumedFood> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<String> mealType;
  final Value<int> quantity;
  final Value<int> portion;
  final Value<String> unit;
  final Value<int> calorie;
  final Value<int> lipids;
  final Value<int> carbohydrates;
  final Value<int> proteins;
  const ConsumedFoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.mealType = const Value.absent(),
    this.quantity = const Value.absent(),
    this.portion = const Value.absent(),
    this.unit = const Value.absent(),
    this.calorie = const Value.absent(),
    this.lipids = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.proteins = const Value.absent(),
  });
  ConsumedFoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required DateTime date,
    @required String mealType,
    @required int quantity,
    @required int portion,
    @required String unit,
    @required int calorie,
    this.lipids = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.proteins = const Value.absent(),
  })  : name = Value(name),
        date = Value(date),
        mealType = Value(mealType),
        quantity = Value(quantity),
        portion = Value(portion),
        unit = Value(unit),
        calorie = Value(calorie);
  static Insertable<ConsumedFood> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> date,
    Expression<String> mealType,
    Expression<int> quantity,
    Expression<int> portion,
    Expression<String> unit,
    Expression<int> calorie,
    Expression<int> lipids,
    Expression<int> carbohydrates,
    Expression<int> proteins,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (mealType != null) 'meal_type': mealType,
      if (quantity != null) 'quantity': quantity,
      if (portion != null) 'portion': portion,
      if (unit != null) 'unit': unit,
      if (calorie != null) 'calorie': calorie,
      if (lipids != null) 'lipids': lipids,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (proteins != null) 'proteins': proteins,
    });
  }

  ConsumedFoodsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> date,
      Value<String> mealType,
      Value<int> quantity,
      Value<int> portion,
      Value<String> unit,
      Value<int> calorie,
      Value<int> lipids,
      Value<int> carbohydrates,
      Value<int> proteins}) {
    return ConsumedFoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      mealType: mealType ?? this.mealType,
      quantity: quantity ?? this.quantity,
      portion: portion ?? this.portion,
      unit: unit ?? this.unit,
      calorie: calorie ?? this.calorie,
      lipids: lipids ?? this.lipids,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      proteins: proteins ?? this.proteins,
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
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (portion.present) {
      map['portion'] = Variable<int>(portion.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (calorie.present) {
      map['calorie'] = Variable<int>(calorie.value);
    }
    if (lipids.present) {
      map['lipids'] = Variable<int>(lipids.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<int>(carbohydrates.value);
    }
    if (proteins.present) {
      map['proteins'] = Variable<int>(proteins.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsumedFoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('mealType: $mealType, ')
          ..write('quantity: $quantity, ')
          ..write('portion: $portion, ')
          ..write('unit: $unit, ')
          ..write('calorie: $calorie, ')
          ..write('lipids: $lipids, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('proteins: $proteins')
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
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedColumn<String> _name;
  @override
  GeneratedColumn<String> get name =>
      _name ??= GeneratedColumn<String>('name', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedColumn<DateTime> _date;
  @override
  GeneratedColumn<DateTime> get date =>
      _date ??= GeneratedColumn<DateTime>('date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _mealTypeMeta = const VerificationMeta('mealType');
  GeneratedColumn<String> _mealType;
  @override
  GeneratedColumn<String> get mealType =>
      _mealType ??= GeneratedColumn<String>('meal_type', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedColumn<int> _quantity;
  @override
  GeneratedColumn<int> get quantity =>
      _quantity ??= GeneratedColumn<int>('quantity', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _portionMeta = const VerificationMeta('portion');
  GeneratedColumn<int> _portion;
  @override
  GeneratedColumn<int> get portion =>
      _portion ??= GeneratedColumn<int>('portion', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  GeneratedColumn<String> _unit;
  @override
  GeneratedColumn<String> get unit =>
      _unit ??= GeneratedColumn<String>('unit', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _calorieMeta = const VerificationMeta('calorie');
  GeneratedColumn<int> _calorie;
  @override
  GeneratedColumn<int> get calorie =>
      _calorie ??= GeneratedColumn<int>('calorie', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _lipidsMeta = const VerificationMeta('lipids');
  GeneratedColumn<int> _lipids;
  @override
  GeneratedColumn<int> get lipids =>
      _lipids ??= GeneratedColumn<int>('lipids', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _carbohydratesMeta =
      const VerificationMeta('carbohydrates');
  GeneratedColumn<int> _carbohydrates;
  @override
  GeneratedColumn<int> get carbohydrates => _carbohydrates ??=
      GeneratedColumn<int>('carbohydrates', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _proteinsMeta = const VerificationMeta('proteins');
  GeneratedColumn<int> _proteins;
  @override
  GeneratedColumn<int> get proteins =>
      _proteins ??= GeneratedColumn<int>('proteins', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        date,
        mealType,
        quantity,
        portion,
        unit,
        calorie,
        lipids,
        carbohydrates,
        proteins
      ];
  @override
  String get aliasedName => _alias ?? 'consumed_foods';
  @override
  String get actualTableName => 'consumed_foods';
  @override
  VerificationContext validateIntegrity(Insertable<ConsumedFood> instance,
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
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('meal_type')) {
      context.handle(_mealTypeMeta,
          mealType.isAcceptableOrUnknown(data['meal_type'], _mealTypeMeta));
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('portion')) {
      context.handle(_portionMeta,
          portion.isAcceptableOrUnknown(data['portion'], _portionMeta));
    } else if (isInserting) {
      context.missing(_portionMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit'], _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('calorie')) {
      context.handle(_calorieMeta,
          calorie.isAcceptableOrUnknown(data['calorie'], _calorieMeta));
    } else if (isInserting) {
      context.missing(_calorieMeta);
    }
    if (data.containsKey('lipids')) {
      context.handle(_lipidsMeta,
          lipids.isAcceptableOrUnknown(data['lipids'], _lipidsMeta));
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
          _carbohydratesMeta,
          carbohydrates.isAcceptableOrUnknown(
              data['carbohydrates'], _carbohydratesMeta));
    }
    if (data.containsKey('proteins')) {
      context.handle(_proteinsMeta,
          proteins.isAcceptableOrUnknown(data['proteins'], _proteinsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConsumedFood map(Map<String, dynamic> data, {String tablePrefix}) {
    return ConsumedFood.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConsumedFoodsTable createAlias(String alias) {
    return $ConsumedFoodsTable(_db, alias);
  }
}

class Objective extends DataClass implements Insertable<Objective> {
  final int objective;
  final DateTime date;
  final String type;
  Objective(
      {@required this.objective, @required this.date, @required this.type});
  factory Objective.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Objective(
      objective: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}objective']),
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
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
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    return map;
  }

  ObjectivesCompanion toCompanion(bool nullToAbsent) {
    return ObjectivesCompanion(
      objective: objective == null && nullToAbsent
          ? const Value.absent()
          : Value(objective),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory Objective.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Objective(
      objective: serializer.fromJson<int>(json['objective']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objective': serializer.toJson<int>(objective),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
    };
  }

  Objective copyWith({int objective, DateTime date, String type}) => Objective(
        objective: objective ?? this.objective,
        date: date ?? this.date,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Objective(')
          ..write('objective: $objective, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(objective, date, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Objective &&
          other.objective == this.objective &&
          other.date == this.date &&
          other.type == this.type);
}

class ObjectivesCompanion extends UpdateCompanion<Objective> {
  final Value<int> objective;
  final Value<DateTime> date;
  final Value<String> type;
  const ObjectivesCompanion({
    this.objective = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
  });
  ObjectivesCompanion.insert({
    @required int objective,
    @required DateTime date,
    @required String type,
  })  : objective = Value(objective),
        date = Value(date),
        type = Value(type);
  static Insertable<Objective> custom({
    Expression<int> objective,
    Expression<DateTime> date,
    Expression<String> type,
  }) {
    return RawValuesInsertable({
      if (objective != null) 'objective': objective,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
    });
  }

  ObjectivesCompanion copyWith(
      {Value<int> objective, Value<DateTime> date, Value<String> type}) {
    return ObjectivesCompanion(
      objective: objective ?? this.objective,
      date: date ?? this.date,
      type: type ?? this.type,
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
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObjectivesCompanion(')
          ..write('objective: $objective, ')
          ..write('date: $date, ')
          ..write('type: $type')
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
  GeneratedColumn<int> _objective;
  @override
  GeneratedColumn<int> get objective =>
      _objective ??= GeneratedColumn<int>('objective', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedColumn<DateTime> _date;
  @override
  GeneratedColumn<DateTime> get date =>
      _date ??= GeneratedColumn<DateTime>('date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedColumn<String> _type;
  @override
  GeneratedColumn<String> get type =>
      _type ??= GeneratedColumn<String>('type', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [objective, date, type];
  @override
  String get aliasedName => _alias ?? 'objectives';
  @override
  String get actualTableName => 'objectives';
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
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date, type};
  @override
  Objective map(Map<String, dynamic> data, {String tablePrefix}) {
    return Objective.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
