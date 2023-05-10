// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_profession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubProfession _$SubProfessionFromJson(Map<String, dynamic> json) =>
    SubProfession(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      profession:
          Profession.fromJson(json['profession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubProfessionToJson(SubProfession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'profession': instance.profession,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
