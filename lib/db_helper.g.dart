// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FoodData extends DataClass implements Insertable<FoodData> {
  final int id;
  final String name;
  final double portion;
  final double calorie;
  final String unit;
  FoodData(
      {@required this.id,
      @required this.name,
      this.portion,
      this.calorie,
      @required this.unit});
  factory FoodData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return FoodData(
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

  FoodCompanion toCompanion(bool nullToAbsent) {
    return FoodCompanion(
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

  factory FoodData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodData(
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

  FoodData copyWith(
          {int id, String name, double portion, double calorie, String unit}) =>
      FoodData(
        id: id ?? this.id,
        name: name ?? this.name,
        portion: portion ?? this.portion,
        calorie: calorie ?? this.calorie,
        unit: unit ?? this.unit,
      );
  @override
  String toString() {
    return (StringBuffer('FoodData(')
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
      (other is FoodData &&
          other.id == this.id &&
          other.name == this.name &&
          other.portion == this.portion &&
          other.calorie == this.calorie &&
          other.unit == this.unit);
}

class FoodCompanion extends UpdateCompanion<FoodData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> portion;
  final Value<double> calorie;
  final Value<String> unit;
  const FoodCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.portion = const Value.absent(),
    this.calorie = const Value.absent(),
    this.unit = const Value.absent(),
  });
  FoodCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.portion = const Value.absent(),
    this.calorie = const Value.absent(),
    @required String unit,
  })  : name = Value(name),
        unit = Value(unit);
  static Insertable<FoodData> custom({
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

  FoodCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<double> portion,
      Value<double> calorie,
      Value<String> unit}) {
    return FoodCompanion(
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
    return (StringBuffer('FoodCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portion: $portion, ')
          ..write('calorie: $calorie, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $FoodTable extends Food with TableInfo<$FoodTable, FoodData> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodTable(this._db, [this._alias]);
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
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _portionMeta = const VerificationMeta('portion');
  GeneratedRealColumn _portion;
  @override
  GeneratedRealColumn get portion => _portion ??= _constructPortion();
  GeneratedRealColumn _constructPortion() {
    return GeneratedRealColumn(
      'portion',
      $tableName,
      true,
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
      true,
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
  $FoodTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'food';
  @override
  final String actualTableName = 'food';
  @override
  VerificationContext validateIntegrity(Insertable<FoodData> instance,
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
    }
    if (data.containsKey('calorie')) {
      context.handle(_calorieMeta,
          calorie.isAcceptableOrUnknown(data['calorie'], _calorieMeta));
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
  FoodData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FoodData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodTable createAlias(String alias) {
    return $FoodTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FoodTable _food;
  $FoodTable get food => _food ??= $FoodTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [food];
}
