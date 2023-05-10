// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemService _$ItemServiceFromJson(Map<String, dynamic> json) => ItemService(
      id: json['id'] as String,
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
      referenceNumber: json['referenceNumber'] as String,
      service: Service.fromJson(json['service'] as Map<String, dynamic>),
      subProfession:
          SubProfession.fromJson(json['subProfession'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>)
          .map((e) => ItemServiceOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ItemServiceToJson(ItemService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isActive': instance.isActive,
      'referenceNumber': instance.referenceNumber,
      'service': instance.service,
      'subProfession': instance.subProfession,
      'options': instance.options,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
