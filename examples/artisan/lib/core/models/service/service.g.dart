// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as String,
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
      referenceNumber: json['referenceNumber'] as String,
      publishedOn: json['publishedOn'] as String,
      subProfession:
          SubProfession.fromJson(json['subProfession'] as Map<String, dynamic>),
      itemServices: (json['itemServices'] as List<dynamic>)
          .map((e) => ItemService.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isActive': instance.isActive,
      'referenceNumber': instance.referenceNumber,
      'publishedOn': instance.publishedOn,
      'subProfession': instance.subProfession,
      'itemServices': instance.itemServices,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
