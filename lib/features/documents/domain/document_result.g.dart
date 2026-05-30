// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_result.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDocumentResultCollection on Isar {
  IsarCollection<DocumentResult> get documentResults => this.collection();
}

const DocumentResultSchema = CollectionSchema(
  name: r'DocumentResult',
  id: 3399935058678080755,
  properties: {
    r'actions': PropertySchema(
      id: 0,
      name: r'actions',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deadlines': PropertySchema(
      id: 2,
      name: r'deadlines',
      type: IsarType.stringList,
    ),
    r'documentType': PropertySchema(
      id: 3,
      name: r'documentType',
      type: IsarType.string,
    ),
    r'hashedNric': PropertySchema(
      id: 4,
      name: r'hashedNric',
      type: IsarType.string,
    ),
    r'isPending': PropertySchema(
      id: 5,
      name: r'isPending',
      type: IsarType.bool,
    ),
    r'plainSummary': PropertySchema(
      id: 6,
      name: r'plainSummary',
      type: IsarType.string,
    ),
    r'rightsFlags': PropertySchema(
      id: 7,
      name: r'rightsFlags',
      type: IsarType.stringList,
    ),
    r'translatedLanguageCode': PropertySchema(
      id: 8,
      name: r'translatedLanguageCode',
      type: IsarType.string,
    ),
    r'translatedSummary': PropertySchema(
      id: 9,
      name: r'translatedSummary',
      type: IsarType.string,
    ),
    r'uncertainty': PropertySchema(
      id: 10,
      name: r'uncertainty',
      type: IsarType.string,
    )
  },
  estimateSize: _documentResultEstimateSize,
  serialize: _documentResultSerialize,
  deserialize: _documentResultDeserialize,
  deserializeProp: _documentResultDeserializeProp,
  idName: r'id',
  indexes: {
    r'hashedNric': IndexSchema(
      id: -2222517547559912126,
      name: r'hashedNric',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hashedNric',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _documentResultGetId,
  getLinks: _documentResultGetLinks,
  attach: _documentResultAttach,
  version: '3.1.0+1',
);

int _documentResultEstimateSize(
  DocumentResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actions.length * 3;
  {
    for (var i = 0; i < object.actions.length; i++) {
      final value = object.actions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.deadlines.length * 3;
  {
    for (var i = 0; i < object.deadlines.length; i++) {
      final value = object.deadlines[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.documentType.length * 3;
  {
    final value = object.hashedNric;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.plainSummary.length * 3;
  bytesCount += 3 + object.rightsFlags.length * 3;
  {
    for (var i = 0; i < object.rightsFlags.length; i++) {
      final value = object.rightsFlags[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.translatedLanguageCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.translatedSummary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uncertainty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _documentResultSerialize(
  DocumentResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.actions);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeStringList(offsets[2], object.deadlines);
  writer.writeString(offsets[3], object.documentType);
  writer.writeString(offsets[4], object.hashedNric);
  writer.writeBool(offsets[5], object.isPending);
  writer.writeString(offsets[6], object.plainSummary);
  writer.writeStringList(offsets[7], object.rightsFlags);
  writer.writeString(offsets[8], object.translatedLanguageCode);
  writer.writeString(offsets[9], object.translatedSummary);
  writer.writeString(offsets[10], object.uncertainty);
}

DocumentResult _documentResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DocumentResult();
  object.actions = reader.readStringList(offsets[0]) ?? [];
  object.createdAt = reader.readDateTime(offsets[1]);
  object.deadlines = reader.readStringList(offsets[2]) ?? [];
  object.documentType = reader.readString(offsets[3]);
  object.hashedNric = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.isPending = reader.readBool(offsets[5]);
  object.plainSummary = reader.readString(offsets[6]);
  object.rightsFlags = reader.readStringList(offsets[7]) ?? [];
  object.translatedLanguageCode = reader.readStringOrNull(offsets[8]);
  object.translatedSummary = reader.readStringOrNull(offsets[9]);
  object.uncertainty = reader.readStringOrNull(offsets[10]);
  return object;
}

P _documentResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _documentResultGetId(DocumentResult object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _documentResultGetLinks(DocumentResult object) {
  return [];
}

void _documentResultAttach(
    IsarCollection<dynamic> col, Id id, DocumentResult object) {
  object.id = id;
}

extension DocumentResultQueryWhereSort
    on QueryBuilder<DocumentResult, DocumentResult, QWhere> {
  QueryBuilder<DocumentResult, DocumentResult, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DocumentResultQueryWhere
    on QueryBuilder<DocumentResult, DocumentResult, QWhereClause> {
  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause> idBetween(
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

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause>
      hashedNricIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hashedNric',
        value: [null],
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause>
      hashedNricIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hashedNric',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause>
      hashedNricEqualTo(String? hashedNric) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hashedNric',
        value: [hashedNric],
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterWhereClause>
      hashedNricNotEqualTo(String? hashedNric) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashedNric',
              lower: [],
              upper: [hashedNric],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashedNric',
              lower: [hashedNric],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashedNric',
              lower: [hashedNric],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashedNric',
              lower: [],
              upper: [hashedNric],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DocumentResultQueryFilter
    on QueryBuilder<DocumentResult, DocumentResult, QFilterCondition> {
  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actions',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actions',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      actionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'actions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deadlines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deadlines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deadlines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deadlines',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deadlines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deadlines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deadlines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deadlines',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deadlines',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deadlines',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deadlines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deadlines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deadlines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deadlines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deadlines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      deadlinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'deadlines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentType',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      documentTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentType',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hashedNric',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hashedNric',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashedNric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashedNric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashedNric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashedNric',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashedNric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashedNric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashedNric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashedNric',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashedNric',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      hashedNricIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashedNric',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      isPendingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPending',
        value: value,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plainSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plainSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plainSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plainSummary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plainSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plainSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plainSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plainSummary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plainSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      plainSummaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plainSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightsFlags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rightsFlags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rightsFlags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rightsFlags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rightsFlags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rightsFlags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rightsFlags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rightsFlags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightsFlags',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rightsFlags',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightsFlags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightsFlags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightsFlags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightsFlags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightsFlags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      rightsFlagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightsFlags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translatedLanguageCode',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translatedLanguageCode',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedLanguageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translatedLanguageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translatedLanguageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translatedLanguageCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translatedLanguageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translatedLanguageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translatedLanguageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translatedLanguageCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedLanguageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedLanguageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translatedLanguageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translatedSummary',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translatedSummary',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translatedSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translatedSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translatedSummary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translatedSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translatedSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translatedSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translatedSummary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      translatedSummaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translatedSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uncertainty',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uncertainty',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uncertainty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uncertainty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uncertainty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uncertainty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uncertainty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uncertainty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uncertainty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uncertainty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uncertainty',
        value: '',
      ));
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterFilterCondition>
      uncertaintyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uncertainty',
        value: '',
      ));
    });
  }
}

extension DocumentResultQueryObject
    on QueryBuilder<DocumentResult, DocumentResult, QFilterCondition> {}

extension DocumentResultQueryLinks
    on QueryBuilder<DocumentResult, DocumentResult, QFilterCondition> {}

extension DocumentResultQuerySortBy
    on QueryBuilder<DocumentResult, DocumentResult, QSortBy> {
  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByHashedNric() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashedNric', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByHashedNricDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashedNric', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy> sortByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByIsPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByPlainSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainSummary', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByPlainSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainSummary', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByTranslatedLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageCode', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByTranslatedLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageCode', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByTranslatedSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedSummary', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByTranslatedSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedSummary', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByUncertainty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncertainty', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      sortByUncertaintyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncertainty', Sort.desc);
    });
  }
}

extension DocumentResultQuerySortThenBy
    on QueryBuilder<DocumentResult, DocumentResult, QSortThenBy> {
  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentType', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByHashedNric() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashedNric', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByHashedNricDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashedNric', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy> thenByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByIsPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByPlainSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainSummary', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByPlainSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainSummary', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByTranslatedLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageCode', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByTranslatedLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageCode', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByTranslatedSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedSummary', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByTranslatedSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedSummary', Sort.desc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByUncertainty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncertainty', Sort.asc);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QAfterSortBy>
      thenByUncertaintyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncertainty', Sort.desc);
    });
  }
}

extension DocumentResultQueryWhereDistinct
    on QueryBuilder<DocumentResult, DocumentResult, QDistinct> {
  QueryBuilder<DocumentResult, DocumentResult, QDistinct> distinctByActions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actions');
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByDeadlines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deadlines');
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByDocumentType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct> distinctByHashedNric(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashedNric', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPending');
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByPlainSummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plainSummary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByRightsFlags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rightsFlags');
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByTranslatedLanguageCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translatedLanguageCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct>
      distinctByTranslatedSummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translatedSummary',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DocumentResult, DocumentResult, QDistinct> distinctByUncertainty(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uncertainty', caseSensitive: caseSensitive);
    });
  }
}

extension DocumentResultQueryProperty
    on QueryBuilder<DocumentResult, DocumentResult, QQueryProperty> {
  QueryBuilder<DocumentResult, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DocumentResult, List<String>, QQueryOperations>
      actionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actions');
    });
  }

  QueryBuilder<DocumentResult, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DocumentResult, List<String>, QQueryOperations>
      deadlinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deadlines');
    });
  }

  QueryBuilder<DocumentResult, String, QQueryOperations>
      documentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentType');
    });
  }

  QueryBuilder<DocumentResult, String?, QQueryOperations> hashedNricProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashedNric');
    });
  }

  QueryBuilder<DocumentResult, bool, QQueryOperations> isPendingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPending');
    });
  }

  QueryBuilder<DocumentResult, String, QQueryOperations>
      plainSummaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plainSummary');
    });
  }

  QueryBuilder<DocumentResult, List<String>, QQueryOperations>
      rightsFlagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rightsFlags');
    });
  }

  QueryBuilder<DocumentResult, String?, QQueryOperations>
      translatedLanguageCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedLanguageCode');
    });
  }

  QueryBuilder<DocumentResult, String?, QQueryOperations>
      translatedSummaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedSummary');
    });
  }

  QueryBuilder<DocumentResult, String?, QQueryOperations>
      uncertaintyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uncertainty');
    });
  }
}
