// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppCollection on Isar {
  IsarCollection<App> get apps => this.collection();
}

const AppSchema = CollectionSchema(
  name: r'App',
  id: -3570643489031920837,
  properties: {
    r'appIcon': PropertySchema(
      id: 0,
      name: r'appIcon',
      type: IsarType.string,
    ),
    r'appName': PropertySchema(
      id: 1,
      name: r'appName',
      type: IsarType.string,
    ),
    r'isTracked': PropertySchema(
      id: 2,
      name: r'isTracked',
      type: IsarType.bool,
    ),
    r'packageName': PropertySchema(
      id: 3,
      name: r'packageName',
      type: IsarType.string,
    ),
    r'timeUsedOnApp': PropertySchema(
      id: 4,
      name: r'timeUsedOnApp',
      type: IsarType.string,
    ),
    r'timeUsedOnAppInSeconds': PropertySchema(
      id: 5,
      name: r'timeUsedOnAppInSeconds',
      type: IsarType.long,
    ),
    r'usageLimit': PropertySchema(
      id: 6,
      name: r'usageLimit',
      type: IsarType.string,
    ),
    r'usageLimitInSeconds': PropertySchema(
      id: 7,
      name: r'usageLimitInSeconds',
      type: IsarType.long,
    ),
    r'versionName': PropertySchema(
      id: 8,
      name: r'versionName',
      type: IsarType.string,
    )
  },
  estimateSize: _appEstimateSize,
  serialize: _appSerialize,
  deserialize: _appDeserialize,
  deserializeProp: _appDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appGetId,
  getLinks: _appGetLinks,
  attach: _appAttach,
  version: '3.1.0+1',
);

int _appEstimateSize(
  App object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.appIcon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.appName.length * 3;
  bytesCount += 3 + object.packageName.length * 3;
  bytesCount += 3 + object.timeUsedOnApp.length * 3;
  bytesCount += 3 + object.usageLimit.length * 3;
  bytesCount += 3 + object.versionName.length * 3;
  return bytesCount;
}

void _appSerialize(
  App object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.appIcon);
  writer.writeString(offsets[1], object.appName);
  writer.writeBool(offsets[2], object.isTracked);
  writer.writeString(offsets[3], object.packageName);
  writer.writeString(offsets[4], object.timeUsedOnApp);
  writer.writeLong(offsets[5], object.timeUsedOnAppInSeconds);
  writer.writeString(offsets[6], object.usageLimit);
  writer.writeLong(offsets[7], object.usageLimitInSeconds);
  writer.writeString(offsets[8], object.versionName);
}

App _appDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = App(
    appIcon: reader.readStringOrNull(offsets[0]),
    appName: reader.readString(offsets[1]),
    isTracked: reader.readBool(offsets[2]),
    packageName: reader.readString(offsets[3]),
    timeUsedOnApp: reader.readString(offsets[4]),
    timeUsedOnAppInSeconds: reader.readLong(offsets[5]),
    usageLimit: reader.readString(offsets[6]),
    usageLimitInSeconds: reader.readLong(offsets[7]),
    versionName: reader.readString(offsets[8]),
  );
  object.id = id;
  return object;
}

P _appDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appGetId(App object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appGetLinks(App object) {
  return [];
}

void _appAttach(IsarCollection<dynamic> col, Id id, App object) {
  object.id = id;
}

extension AppQueryWhereSort on QueryBuilder<App, App, QWhere> {
  QueryBuilder<App, App, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppQueryWhere on QueryBuilder<App, App, QWhereClause> {
  QueryBuilder<App, App, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<App, App, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<App, App, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<App, App, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<App, App, QAfterWhereClause> idBetween(
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

extension AppQueryFilter on QueryBuilder<App, App, QFilterCondition> {
  QueryBuilder<App, App, QAfterFilterCondition> appIconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appIcon',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appIcon',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appIcon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appName',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> appNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appName',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<App, App, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<App, App, QAfterFilterCondition> idBetween(
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

  QueryBuilder<App, App, QAfterFilterCondition> isTrackedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTracked',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> packageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeUsedOnApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeUsedOnApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeUsedOnApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeUsedOnApp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeUsedOnApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeUsedOnApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeUsedOnApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeUsedOnApp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeUsedOnApp',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeUsedOnApp',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppInSecondsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeUsedOnAppInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition>
      timeUsedOnAppInSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeUsedOnAppInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppInSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeUsedOnAppInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> timeUsedOnAppInSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeUsedOnAppInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageLimit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageLimit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageLimit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageLimit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usageLimit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usageLimit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usageLimit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usageLimit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageLimit',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usageLimit',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitInSecondsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageLimitInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitInSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageLimitInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitInSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageLimitInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> usageLimitInSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageLimitInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'versionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'versionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'versionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'versionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'versionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'versionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'versionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'versionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'versionName',
        value: '',
      ));
    });
  }

  QueryBuilder<App, App, QAfterFilterCondition> versionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'versionName',
        value: '',
      ));
    });
  }
}

extension AppQueryObject on QueryBuilder<App, App, QFilterCondition> {}

extension AppQueryLinks on QueryBuilder<App, App, QFilterCondition> {}

extension AppQuerySortBy on QueryBuilder<App, App, QSortBy> {
  QueryBuilder<App, App, QAfterSortBy> sortByAppIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIcon', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByAppIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIcon', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByIsTracked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTracked', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByIsTrackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTracked', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByTimeUsedOnApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnApp', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByTimeUsedOnAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnApp', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByTimeUsedOnAppInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnAppInSeconds', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByTimeUsedOnAppInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnAppInSeconds', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByUsageLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimit', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByUsageLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimit', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByUsageLimitInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInSeconds', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByUsageLimitInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInSeconds', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByVersionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionName', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> sortByVersionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionName', Sort.desc);
    });
  }
}

extension AppQuerySortThenBy on QueryBuilder<App, App, QSortThenBy> {
  QueryBuilder<App, App, QAfterSortBy> thenByAppIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIcon', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByAppIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIcon', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByIsTracked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTracked', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByIsTrackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTracked', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByTimeUsedOnApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnApp', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByTimeUsedOnAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnApp', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByTimeUsedOnAppInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnAppInSeconds', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByTimeUsedOnAppInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeUsedOnAppInSeconds', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByUsageLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimit', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByUsageLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimit', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByUsageLimitInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInSeconds', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByUsageLimitInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInSeconds', Sort.desc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByVersionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionName', Sort.asc);
    });
  }

  QueryBuilder<App, App, QAfterSortBy> thenByVersionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionName', Sort.desc);
    });
  }
}

extension AppQueryWhereDistinct on QueryBuilder<App, App, QDistinct> {
  QueryBuilder<App, App, QDistinct> distinctByAppIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appIcon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByAppName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByIsTracked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTracked');
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByPackageName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByTimeUsedOnApp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeUsedOnApp',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByTimeUsedOnAppInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeUsedOnAppInSeconds');
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByUsageLimit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageLimit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByUsageLimitInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageLimitInSeconds');
    });
  }

  QueryBuilder<App, App, QDistinct> distinctByVersionName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'versionName', caseSensitive: caseSensitive);
    });
  }
}

extension AppQueryProperty on QueryBuilder<App, App, QQueryProperty> {
  QueryBuilder<App, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<App, String?, QQueryOperations> appIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appIcon');
    });
  }

  QueryBuilder<App, String, QQueryOperations> appNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appName');
    });
  }

  QueryBuilder<App, bool, QQueryOperations> isTrackedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTracked');
    });
  }

  QueryBuilder<App, String, QQueryOperations> packageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packageName');
    });
  }

  QueryBuilder<App, String, QQueryOperations> timeUsedOnAppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeUsedOnApp');
    });
  }

  QueryBuilder<App, int, QQueryOperations> timeUsedOnAppInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeUsedOnAppInSeconds');
    });
  }

  QueryBuilder<App, String, QQueryOperations> usageLimitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageLimit');
    });
  }

  QueryBuilder<App, int, QQueryOperations> usageLimitInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageLimitInSeconds');
    });
  }

  QueryBuilder<App, String, QQueryOperations> versionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionName');
    });
  }
}
