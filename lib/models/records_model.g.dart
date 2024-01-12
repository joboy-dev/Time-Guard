// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecordCollection on Isar {
  IsarCollection<Record> get records => this.collection();
}

const RecordSchema = CollectionSchema(
  name: r'Record',
  id: -5560585825827271694,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'mostUsedApp': PropertySchema(
      id: 1,
      name: r'mostUsedApp',
      type: IsarType.string,
    ),
    r'noOfAppsUsed': PropertySchema(
      id: 2,
      name: r'noOfAppsUsed',
      type: IsarType.long,
    ),
    r'overallScreenTime': PropertySchema(
      id: 3,
      name: r'overallScreenTime',
      type: IsarType.long,
    ),
    r'overallScreenTimeRefined': PropertySchema(
      id: 4,
      name: r'overallScreenTimeRefined',
      type: IsarType.string,
    ),
    r'timeForMostUsedApp': PropertySchema(
      id: 5,
      name: r'timeForMostUsedApp',
      type: IsarType.string,
    ),
    r'timeForMostUsedAppInSeconds': PropertySchema(
      id: 6,
      name: r'timeForMostUsedAppInSeconds',
      type: IsarType.long,
    )
  },
  estimateSize: _recordEstimateSize,
  serialize: _recordSerialize,
  deserialize: _recordDeserialize,
  deserializeProp: _recordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recordGetId,
  getLinks: _recordGetLinks,
  attach: _recordAttach,
  version: '3.1.0+1',
);

int _recordEstimateSize(
  Record object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.mostUsedApp.length * 3;
  bytesCount += 3 + object.overallScreenTimeRefined.length * 3;
  bytesCount += 3 + object.timeForMostUsedApp.length * 3;
  return bytesCount;
}

void _recordSerialize(
  Record object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeString(offsets[1], object.mostUsedApp);
  writer.writeLong(offsets[2], object.noOfAppsUsed);
  writer.writeLong(offsets[3], object.overallScreenTime);
  writer.writeString(offsets[4], object.overallScreenTimeRefined);
  writer.writeString(offsets[5], object.timeForMostUsedApp);
  writer.writeLong(offsets[6], object.timeForMostUsedAppInSeconds);
}

Record _recordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Record(
    date: reader.readString(offsets[0]),
    mostUsedApp: reader.readString(offsets[1]),
    noOfAppsUsed: reader.readLong(offsets[2]),
    overallScreenTime: reader.readLong(offsets[3]),
    overallScreenTimeRefined: reader.readString(offsets[4]),
    timeForMostUsedApp: reader.readString(offsets[5]),
    timeForMostUsedAppInSeconds: reader.readLong(offsets[6]),
  );
  object.id = id;
  return object;
}

P _recordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recordGetId(Record object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recordGetLinks(Record object) {
  return [];
}

void _recordAttach(IsarCollection<dynamic> col, Id id, Record object) {
  object.id = id;
}

extension RecordQueryWhereSort on QueryBuilder<Record, Record, QWhere> {
  QueryBuilder<Record, Record, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecordQueryWhere on QueryBuilder<Record, Record, QWhereClause> {
  QueryBuilder<Record, Record, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordQueryFilter on QueryBuilder<Record, Record, QFilterCondition> {
  QueryBuilder<Record, Record, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mostUsedApp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mostUsedApp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mostUsedApp',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mostUsedAppIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mostUsedApp',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> noOfAppsUsedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noOfAppsUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> noOfAppsUsedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noOfAppsUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> noOfAppsUsedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noOfAppsUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> noOfAppsUsedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noOfAppsUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> overallScreenTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallScreenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallScreenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> overallScreenTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallScreenTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> overallScreenTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallScreenTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallScreenTimeRefined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallScreenTimeRefined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallScreenTimeRefined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallScreenTimeRefined',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'overallScreenTimeRefined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'overallScreenTimeRefined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'overallScreenTimeRefined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'overallScreenTimeRefined',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallScreenTimeRefined',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      overallScreenTimeRefinedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'overallScreenTimeRefined',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeForMostUsedAppEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeForMostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeForMostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeForMostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeForMostUsedAppBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeForMostUsedApp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeForMostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeForMostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeForMostUsedApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeForMostUsedAppMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeForMostUsedApp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeForMostUsedApp',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeForMostUsedApp',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppInSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeForMostUsedAppInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppInSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeForMostUsedAppInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppInSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeForMostUsedAppInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      timeForMostUsedAppInSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeForMostUsedAppInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordQueryObject on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQueryLinks on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQuerySortBy on QueryBuilder<Record, Record, QSortBy> {
  QueryBuilder<Record, Record, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByMostUsedApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedApp', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByMostUsedAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedApp', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNoOfAppsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfAppsUsed', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNoOfAppsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfAppsUsed', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByOverallScreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTime', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByOverallScreenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTime', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByOverallScreenTimeRefined() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTimeRefined', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      sortByOverallScreenTimeRefinedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTimeRefined', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByTimeForMostUsedApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedApp', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByTimeForMostUsedAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedApp', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      sortByTimeForMostUsedAppInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedAppInSeconds', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      sortByTimeForMostUsedAppInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedAppInSeconds', Sort.desc);
    });
  }
}

extension RecordQuerySortThenBy on QueryBuilder<Record, Record, QSortThenBy> {
  QueryBuilder<Record, Record, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByMostUsedApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedApp', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByMostUsedAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mostUsedApp', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNoOfAppsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfAppsUsed', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNoOfAppsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfAppsUsed', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByOverallScreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTime', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByOverallScreenTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTime', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByOverallScreenTimeRefined() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTimeRefined', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      thenByOverallScreenTimeRefinedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScreenTimeRefined', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByTimeForMostUsedApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedApp', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByTimeForMostUsedAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedApp', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      thenByTimeForMostUsedAppInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedAppInSeconds', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      thenByTimeForMostUsedAppInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeForMostUsedAppInSeconds', Sort.desc);
    });
  }
}

extension RecordQueryWhereDistinct on QueryBuilder<Record, Record, QDistinct> {
  QueryBuilder<Record, Record, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByMostUsedApp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mostUsedApp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByNoOfAppsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noOfAppsUsed');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByOverallScreenTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallScreenTime');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByOverallScreenTimeRefined(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallScreenTimeRefined',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByTimeForMostUsedApp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeForMostUsedApp',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct>
      distinctByTimeForMostUsedAppInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeForMostUsedAppInSeconds');
    });
  }
}

extension RecordQueryProperty on QueryBuilder<Record, Record, QQueryProperty> {
  QueryBuilder<Record, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> mostUsedAppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mostUsedApp');
    });
  }

  QueryBuilder<Record, int, QQueryOperations> noOfAppsUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noOfAppsUsed');
    });
  }

  QueryBuilder<Record, int, QQueryOperations> overallScreenTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallScreenTime');
    });
  }

  QueryBuilder<Record, String, QQueryOperations>
      overallScreenTimeRefinedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallScreenTimeRefined');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> timeForMostUsedAppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeForMostUsedApp');
    });
  }

  QueryBuilder<Record, int, QQueryOperations>
      timeForMostUsedAppInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeForMostUsedAppInSeconds');
    });
  }
}
