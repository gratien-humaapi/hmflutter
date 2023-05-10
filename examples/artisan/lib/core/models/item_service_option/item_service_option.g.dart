// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_service_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemServiceOption _$ItemServiceOptionFromJson(Map<String, dynamic> json) =>
    ItemServiceOption(
      id: json['id'] as String,
      isRequired: json['isRequired'] as bool,
      relatedItems: (json['relatedItems'] as List<dynamic>)
          .map((e) =>
              ServiceOptionRelatedType.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['unit'] as String,
      lineNumber: json['lineNumber'] as String,
      itemService:
          ItemService.fromJson(json['itemService'] as Map<String, dynamic>),
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ItemServiceOptionToJson(ItemServiceOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isRequired': instance.isRequired,
      'isActive': instance.isActive,
      'relatedItems': instance.relatedItems,
      'type': instance.type,
      'questions': instance.questions,
      'unit': instance.unit,
      'lineNumber': instance.lineNumber,
      'itemService': instance.itemService,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
