// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShiftLogCollection on Isar {
  IsarCollection<ShiftLog> get shiftLogs => this.collection();
}

const ShiftLogSchema = CollectionSchema(
  name: r'ShiftLog',
  id: 1444455345808079967,
  properties: {
    r'basicHourlyRate': PropertySchema(
      id: 0,
      name: r'basicHourlyRate',
      type: IsarType.double,
    ),
    r'breakMinutes': PropertySchema(
      id: 1,
      name: r'breakMinutes',
      type: IsarType.long,
    ),
    r'clockIn': PropertySchema(
      id: 2,
      name: r'clockIn',
      type: IsarType.dateTime,
    ),
    r'clockOut': PropertySchema(
      id: 3,
      name: r'clockOut',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 4,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 5,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'ocrSourcePath': PropertySchema(
      id: 6,
      name: r'ocrSourcePath',
      type: IsarType.string,
    ),
    r'shiftType': PropertySchema(
      id: 7,
      name: r'shiftType',
      type: IsarType.string,
      enumMap: _ShiftLogshiftTypeEnumValueMap,
    )
  },
  estimateSize: _shiftLogEstimateSize,
  serialize: _shiftLogSerialize,
  deserialize: _shiftLogDeserialize,
  deserializeProp: _shiftLogDeserializeProp,
  idName: r'id',
  indexes: {
    r'clockIn': IndexSchema(
      id: 2898206528224234958,
      name: r'clockIn',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'clockIn',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _shiftLogGetId,
  getLinks: _shiftLogGetLinks,
  attach: _shiftLogAttach,
  version: '3.1.0+1',
);

int _shiftLogEstimateSize(
  ShiftLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ocrSourcePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.shiftType.name.length * 3;
  return bytesCount;
}

void _shiftLogSerialize(
  ShiftLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.basicHourlyRate);
  writer.writeLong(offsets[1], object.breakMinutes);
  writer.writeDateTime(offsets[2], object.clockIn);
  writer.writeDateTime(offsets[3], object.clockOut);
  writer.writeDouble(offsets[4], object.latitude);
  writer.writeDouble(offsets[5], object.longitude);
  writer.writeString(offsets[6], object.ocrSourcePath);
  writer.writeString(offsets[7], object.shiftType.name);
}

ShiftLog _shiftLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShiftLog();
  object.basicHourlyRate = reader.readDouble(offsets[0]);
  object.breakMinutes = reader.readLong(offsets[1]);
  object.clockIn = reader.readDateTime(offsets[2]);
  object.clockOut = reader.readDateTime(offsets[3]);
  object.id = id;
  object.latitude = reader.readDoubleOrNull(offsets[4]);
  object.longitude = reader.readDoubleOrNull(offsets[5]);
  object.ocrSourcePath = reader.readStringOrNull(offsets[6]);
  object.shiftType =
      _ShiftLogshiftTypeValueEnumMap[reader.readStringOrNull(offsets[7])] ??
          ShiftType.normal;
  return object;
}

P _shiftLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_ShiftLogshiftTypeValueEnumMap[reader.readStringOrNull(offset)] ??
          ShiftType.normal) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ShiftLogshiftTypeEnumValueMap = {
  r'normal': r'normal',
  r'restDay': r'restDay',
  r'publicHoliday': r'publicHoliday',
};
const _ShiftLogshiftTypeValueEnumMap = {
  r'normal': ShiftType.normal,
  r'restDay': ShiftType.restDay,
  r'publicHoliday': ShiftType.publicHoliday,
};

Id _shiftLogGetId(ShiftLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shiftLogGetLinks(ShiftLog object) {
  return [];
}

void _shiftLogAttach(IsarCollection<dynamic> col, Id id, ShiftLog object) {
  object.id = id;
}

extension ShiftLogQueryWhereSort on QueryBuilder<ShiftLog, ShiftLog, QWhere> {
  QueryBuilder<ShiftLog, ShiftLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhere> anyClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'clockIn'),
      );
    });
  }
}

extension ShiftLogQueryWhere on QueryBuilder<ShiftLog, ShiftLog, QWhereClause> {
  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> idBetween(
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

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> clockInEqualTo(
      DateTime clockIn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clockIn',
        value: [clockIn],
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> clockInNotEqualTo(
      DateTime clockIn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clockIn',
              lower: [],
              upper: [clockIn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clockIn',
              lower: [clockIn],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clockIn',
              lower: [clockIn],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clockIn',
              lower: [],
              upper: [clockIn],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> clockInGreaterThan(
    DateTime clockIn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clockIn',
        lower: [clockIn],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> clockInLessThan(
    DateTime clockIn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clockIn',
        lower: [],
        upper: [clockIn],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterWhereClause> clockInBetween(
    DateTime lowerClockIn,
    DateTime upperClockIn, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clockIn',
        lower: [lowerClockIn],
        includeLower: includeLower,
        upper: [upperClockIn],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ShiftLogQueryFilter
    on QueryBuilder<ShiftLog, ShiftLog, QFilterCondition> {
  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      basicHourlyRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'basicHourlyRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      basicHourlyRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'basicHourlyRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      basicHourlyRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'basicHourlyRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      basicHourlyRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'basicHourlyRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> breakMinutesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'breakMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      breakMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'breakMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> breakMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'breakMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> breakMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'breakMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockInEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clockIn',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockInGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clockIn',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockInLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clockIn',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockInBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clockIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockOutEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clockOut',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockOutGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clockOut',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockOutLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clockOut',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> clockOutBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clockOut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> latitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> latitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> latitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> latitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> longitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> longitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> longitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> longitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      ocrSourcePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ocrSourcePath',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      ocrSourcePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ocrSourcePath',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> ocrSourcePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ocrSourcePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      ocrSourcePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ocrSourcePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> ocrSourcePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ocrSourcePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> ocrSourcePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ocrSourcePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      ocrSourcePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ocrSourcePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> ocrSourcePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ocrSourcePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> ocrSourcePathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ocrSourcePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> ocrSourcePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ocrSourcePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      ocrSourcePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ocrSourcePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      ocrSourcePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ocrSourcePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeEqualTo(
    ShiftType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shiftType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeGreaterThan(
    ShiftType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shiftType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeLessThan(
    ShiftType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shiftType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeBetween(
    ShiftType lower,
    ShiftType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shiftType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shiftType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shiftType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shiftType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shiftType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition> shiftTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shiftType',
        value: '',
      ));
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterFilterCondition>
      shiftTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shiftType',
        value: '',
      ));
    });
  }
}

extension ShiftLogQueryObject
    on QueryBuilder<ShiftLog, ShiftLog, QFilterCondition> {}

extension ShiftLogQueryLinks
    on QueryBuilder<ShiftLog, ShiftLog, QFilterCondition> {}

extension ShiftLogQuerySortBy on QueryBuilder<ShiftLog, ShiftLog, QSortBy> {
  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByBasicHourlyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicHourlyRate', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByBasicHourlyRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicHourlyRate', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByBreakMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakMinutes', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByBreakMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakMinutes', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockIn', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockIn', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOut', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOut', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByOcrSourcePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ocrSourcePath', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByOcrSourcePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ocrSourcePath', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByShiftType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftType', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> sortByShiftTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftType', Sort.desc);
    });
  }
}

extension ShiftLogQuerySortThenBy
    on QueryBuilder<ShiftLog, ShiftLog, QSortThenBy> {
  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByBasicHourlyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicHourlyRate', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByBasicHourlyRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicHourlyRate', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByBreakMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakMinutes', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByBreakMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breakMinutes', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockIn', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByClockInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockIn', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOut', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByClockOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clockOut', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByOcrSourcePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ocrSourcePath', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByOcrSourcePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ocrSourcePath', Sort.desc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByShiftType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftType', Sort.asc);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QAfterSortBy> thenByShiftTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shiftType', Sort.desc);
    });
  }
}

extension ShiftLogQueryWhereDistinct
    on QueryBuilder<ShiftLog, ShiftLog, QDistinct> {
  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByBasicHourlyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'basicHourlyRate');
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByBreakMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'breakMinutes');
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByClockIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockIn');
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByClockOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clockOut');
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByOcrSourcePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ocrSourcePath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShiftLog, ShiftLog, QDistinct> distinctByShiftType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shiftType', caseSensitive: caseSensitive);
    });
  }
}

extension ShiftLogQueryProperty
    on QueryBuilder<ShiftLog, ShiftLog, QQueryProperty> {
  QueryBuilder<ShiftLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShiftLog, double, QQueryOperations> basicHourlyRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'basicHourlyRate');
    });
  }

  QueryBuilder<ShiftLog, int, QQueryOperations> breakMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'breakMinutes');
    });
  }

  QueryBuilder<ShiftLog, DateTime, QQueryOperations> clockInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockIn');
    });
  }

  QueryBuilder<ShiftLog, DateTime, QQueryOperations> clockOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clockOut');
    });
  }

  QueryBuilder<ShiftLog, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<ShiftLog, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<ShiftLog, String?, QQueryOperations> ocrSourcePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ocrSourcePath');
    });
  }

  QueryBuilder<ShiftLog, ShiftType, QQueryOperations> shiftTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shiftType');
    });
  }
}
