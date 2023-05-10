// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserService _$UserServiceFromJson(Map<String, dynamic> json) => UserService(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      serviceImage: json['serviceImage'] as String?,
      owner: json['owner'] as String,
      tarification: json['tarification'] as String,
      tarifMinimum: json['tarifMinimum'] as String,
      service: Service.fromJson(json['service'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] as String,
      reviewers:
          (json['reviewers'] as List<dynamic>).map((e) => e as String).toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => UserServiceOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool,
      referenceNumber: json['referenceNumber'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserServiceToJson(UserService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isActive': instance.isActive,
      'referenceNumber': instance.referenceNumber,
      'status': instance.status,
      'owner': instance.owner,
      'service': instance.service,
      'updatedBy': instance.updatedBy,
      'tarification': instance.tarification,
      'tarifMinimum': instance.tarifMinimum,
      'serviceImage': instance.serviceImage,
      'reviewers': instance.reviewers,
      'options': instance.options,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
