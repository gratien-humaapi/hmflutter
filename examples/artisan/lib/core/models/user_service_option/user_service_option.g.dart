// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServiceOption _$UserServiceOptionFromJson(Map<String, dynamic> json) =>
    UserServiceOption(
      id: json['id'] as String,
      isActive: json['isActive'] as bool,
      isRequired: json['isRequired'] as bool,
      relatedItems: (json['relatedItems'] as List<dynamic>)
          .map((e) =>
              ServiceOptionRelatedType.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['unit'] as String,
      price: json['price'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      lineNumber: json['lineNumber'] as String,
      isTaxable: json['isTaxable'] as bool,
      userService:
          UserService.fromJson(json['userService'] as Map<String, dynamic>),
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserServiceOptionToJson(UserServiceOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isActive': instance.isActive,
      'isRequired': instance.isRequired,
      'relatedItems': instance.relatedItems,
      'unit': instance.unit,
      'price': instance.price,
      'questions': instance.questions,
      'lineNumber': instance.lineNumber,
      'isTaxable': instance.isTaxable,
      'userService': instance.userService,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
