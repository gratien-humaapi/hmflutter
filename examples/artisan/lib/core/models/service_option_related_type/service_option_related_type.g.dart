// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_option_related_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOptionRelatedType _$ServiceOptionRelatedTypeFromJson(
        Map<String, dynamic> json) =>
    ServiceOptionRelatedType(
      id: json['id'] as String,
      lineNumber: json['lineNumber'] as String,
      relatedValues: (json['relatedValues'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ServiceOptionRelatedTypeToJson(
        ServiceOptionRelatedType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relatedValues': instance.relatedValues,
      'lineNumber': instance.lineNumber,
    };
