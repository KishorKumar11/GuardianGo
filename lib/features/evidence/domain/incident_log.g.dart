// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIncidentLogCollection on Isar {
  IsarCollection<IncidentLog> get incidentLogs => this.collection();
}

const IncidentLogSchema = CollectionSchema(
  name: r'IncidentLog',
  id: -2025394177571525168,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
      enumMap: _IncidentLogcategoryEnumValueMap,
    ),
    r'encryptedMediaPaths': PropertySchema(
      id: 1,
      name: r'encryptedMediaPaths',
      type: IsarType.stringList,
    ),
    r'encryptedNotes': PropertySchema(
      id: 2,
      name: r'encryptedNotes',
      type: IsarType.string,
    ),
    r'encryptedSyncPayload': PropertySchema(
      id: 3,
      name: r'encryptedSyncPayload',
      type: IsarType.string,
    ),
    r'encryptedVoiceNotePath': PropertySchema(
      id: 4,
      name: r'encryptedVoiceNotePath',
      type: IsarType.string,
    ),
    r'latitude': PropertySchema(
      id: 5,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 6,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'ntpDiscrepancy': PropertySchema(
      id: 7,
      name: r'ntpDiscrepancy',
      type: IsarType.bool,
    ),
    r'ntpTimestamp': PropertySchema(
      id: 8,
      name: r'ntpTimestamp',
      type: IsarType.dateTime,
    ),
    r'timestamp': PropertySchema(
      id: 9,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _incidentLogEstimateSize,
  serialize: _incidentLogSerialize,
  deserialize: _incidentLogDeserialize,
  deserializeProp: _incidentLogDeserializeProp,
  idName: r'id',
  indexes: {
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _incidentLogGetId,
  getLinks: _incidentLogGetLinks,
  attach: _incidentLogAttach,
  version: '3.1.0+1',
);

int _incidentLogEstimateSize(
  IncidentLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.name.length * 3;
  bytesCount += 3 + object.encryptedMediaPaths.length * 3;
  {
    for (var i = 0; i < object.encryptedMediaPaths.length; i++) {
      final value = object.encryptedMediaPaths[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.encryptedNotes.length * 3;
  {
    final value = object.encryptedSyncPayload;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.encryptedVoiceNotePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _incidentLogSerialize(
  IncidentLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category.name);
  writer.writeStringList(offsets[1], object.encryptedMediaPaths);
  writer.writeString(offsets[2], object.encryptedNotes);
  writer.writeString(offsets[3], object.encryptedSyncPayload);
  writer.writeString(offsets[4], object.encryptedVoiceNotePath);
  writer.writeDouble(offsets[5], object.latitude);
  writer.writeDouble(offsets[6], object.longitude);
  writer.writeBool(offsets[7], object.ntpDiscrepancy);
  writer.writeDateTime(offsets[8], object.ntpTimestamp);
  writer.writeDateTime(offsets[9], object.timestamp);
}

IncidentLog _incidentLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IncidentLog();
  object.category =
      _IncidentLogcategoryValueEnumMap[reader.readStringOrNull(offsets[0])] ??
          IncidentCategory.injury;
  object.encryptedMediaPaths = reader.readStringList(offsets[1]) ?? [];
  object.encryptedNotes = reader.readString(offsets[2]);
  object.encryptedSyncPayload = reader.readStringOrNull(offsets[3]);
  object.encryptedVoiceNotePath = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.latitude = reader.readDoubleOrNull(offsets[5]);
  object.longitude = reader.readDoubleOrNull(offsets[6]);
  object.ntpDiscrepancy = reader.readBool(offsets[7]);
  object.ntpTimestamp = reader.readDateTimeOrNull(offsets[8]);
  object.timestamp = reader.readDateTime(offsets[9]);
  return object;
}

P _incidentLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_IncidentLogcategoryValueEnumMap[
              reader.readStringOrNull(offset)] ??
          IncidentCategory.injury) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IncidentLogcategoryEnumValueMap = {
  r'injury': r'injury',
  r'unsafeCondition': r'unsafeCondition',
  r'dispute': r'dispute',
  r'harassment': r'harassment',
  r'other': r'other',
};
const _IncidentLogcategoryValueEnumMap = {
  r'injury': IncidentCategory.injury,
  r'unsafeCondition': IncidentCategory.unsafeCondition,
  r'dispute': IncidentCategory.dispute,
  r'harassment': IncidentCategory.harassment,
  r'other': IncidentCategory.other,
};

Id _incidentLogGetId(IncidentLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _incidentLogGetLinks(IncidentLog object) {
  return [];
}

void _incidentLogAttach(
    IsarCollection<dynamic> col, Id id, IncidentLog object) {
  object.id = id;
}

extension IncidentLogQueryWhereSort
    on QueryBuilder<IncidentLog, IncidentLog, QWhere> {
  QueryBuilder<IncidentLog, IncidentLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhere> anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension IncidentLogQueryWhere
    on QueryBuilder<IncidentLog, IncidentLog, QWhereClause> {
  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> idBetween(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> timestampEqualTo(
      DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timestamp',
        value: [timestamp],
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> timestampNotEqualTo(
      DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause>
      timestampGreaterThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [timestamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> timestampLessThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [],
        upper: [timestamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterWhereClause> timestampBetween(
    DateTime lowerTimestamp,
    DateTime upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [lowerTimestamp],
        includeLower: includeLower,
        upper: [upperTimestamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IncidentLogQueryFilter
    on QueryBuilder<IncidentLog, IncidentLog, QFilterCondition> {
  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> categoryEqualTo(
    IncidentCategory value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      categoryGreaterThan(
    IncidentCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      categoryLessThan(
    IncidentCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> categoryBetween(
    IncidentCategory lower,
    IncidentCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedMediaPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encryptedMediaPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encryptedMediaPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encryptedMediaPaths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encryptedMediaPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encryptedMediaPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encryptedMediaPaths',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encryptedMediaPaths',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedMediaPaths',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encryptedMediaPaths',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encryptedMediaPaths',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encryptedMediaPaths',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encryptedMediaPaths',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encryptedMediaPaths',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encryptedMediaPaths',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedMediaPathsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encryptedMediaPaths',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encryptedNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encryptedNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encryptedNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encryptedNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encryptedNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encryptedNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encryptedNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encryptedNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'encryptedSyncPayload',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'encryptedSyncPayload',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedSyncPayload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encryptedSyncPayload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encryptedSyncPayload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encryptedSyncPayload',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encryptedSyncPayload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encryptedSyncPayload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encryptedSyncPayload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encryptedSyncPayload',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedSyncPayload',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedSyncPayloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encryptedSyncPayload',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'encryptedVoiceNotePath',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'encryptedVoiceNotePath',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedVoiceNotePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encryptedVoiceNotePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encryptedVoiceNotePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encryptedVoiceNotePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encryptedVoiceNotePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encryptedVoiceNotePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encryptedVoiceNotePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encryptedVoiceNotePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedVoiceNotePath',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      encryptedVoiceNotePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encryptedVoiceNotePath',
        value: '',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      latitudeGreaterThan(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      latitudeLessThan(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      longitudeEqualTo(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      longitudeGreaterThan(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      longitudeLessThan(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      longitudeBetween(
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

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      ntpDiscrepancyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ntpDiscrepancy',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      ntpTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ntpTimestamp',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      ntpTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ntpTimestamp',
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      ntpTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ntpTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      ntpTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ntpTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      ntpTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ntpTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      ntpTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ntpTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IncidentLogQueryObject
    on QueryBuilder<IncidentLog, IncidentLog, QFilterCondition> {}

extension IncidentLogQueryLinks
    on QueryBuilder<IncidentLog, IncidentLog, QFilterCondition> {}

extension IncidentLogQuerySortBy
    on QueryBuilder<IncidentLog, IncidentLog, QSortBy> {
  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByEncryptedNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedNotes', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      sortByEncryptedNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedNotes', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      sortByEncryptedSyncPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedSyncPayload', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      sortByEncryptedSyncPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedSyncPayload', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      sortByEncryptedVoiceNotePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedVoiceNotePath', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      sortByEncryptedVoiceNotePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedVoiceNotePath', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByNtpDiscrepancy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpDiscrepancy', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      sortByNtpDiscrepancyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpDiscrepancy', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByNtpTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpTimestamp', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      sortByNtpTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpTimestamp', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension IncidentLogQuerySortThenBy
    on QueryBuilder<IncidentLog, IncidentLog, QSortThenBy> {
  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByEncryptedNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedNotes', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      thenByEncryptedNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedNotes', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      thenByEncryptedSyncPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedSyncPayload', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      thenByEncryptedSyncPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedSyncPayload', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      thenByEncryptedVoiceNotePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedVoiceNotePath', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      thenByEncryptedVoiceNotePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedVoiceNotePath', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByNtpDiscrepancy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpDiscrepancy', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      thenByNtpDiscrepancyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpDiscrepancy', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByNtpTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpTimestamp', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy>
      thenByNtpTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ntpTimestamp', Sort.desc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension IncidentLogQueryWhereDistinct
    on QueryBuilder<IncidentLog, IncidentLog, QDistinct> {
  QueryBuilder<IncidentLog, IncidentLog, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct>
      distinctByEncryptedMediaPaths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encryptedMediaPaths');
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct> distinctByEncryptedNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encryptedNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct>
      distinctByEncryptedSyncPayload({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encryptedSyncPayload',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct>
      distinctByEncryptedVoiceNotePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encryptedVoiceNotePath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct> distinctByNtpDiscrepancy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ntpDiscrepancy');
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct> distinctByNtpTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ntpTimestamp');
    });
  }

  QueryBuilder<IncidentLog, IncidentLog, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension IncidentLogQueryProperty
    on QueryBuilder<IncidentLog, IncidentLog, QQueryProperty> {
  QueryBuilder<IncidentLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IncidentLog, IncidentCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<IncidentLog, List<String>, QQueryOperations>
      encryptedMediaPathsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encryptedMediaPaths');
    });
  }

  QueryBuilder<IncidentLog, String, QQueryOperations> encryptedNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encryptedNotes');
    });
  }

  QueryBuilder<IncidentLog, String?, QQueryOperations>
      encryptedSyncPayloadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encryptedSyncPayload');
    });
  }

  QueryBuilder<IncidentLog, String?, QQueryOperations>
      encryptedVoiceNotePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encryptedVoiceNotePath');
    });
  }

  QueryBuilder<IncidentLog, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<IncidentLog, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<IncidentLog, bool, QQueryOperations> ntpDiscrepancyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ntpDiscrepancy');
    });
  }

  QueryBuilder<IncidentLog, DateTime?, QQueryOperations>
      ntpTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ntpTimestamp');
    });
  }

  QueryBuilder<IncidentLog, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
