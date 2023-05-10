import 'package:artisan/core/models/user_service/user_service.dart';
import 'package:json_annotation/json_annotation.dart';

import '../question/question.dart';
import '../service_option_related_type/service_option_related_type.dart';

part 'user_service_option.g.dart';

@JsonSerializable()
class UserServiceOption {
  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final bool isRequired;
  final List<ServiceOptionRelatedType> relatedItems;
  final String unit;
  final String price;
  final List<Question> questions;
  final String lineNumber;
  final bool isTaxable;
  final UserService userService;
  final String createdAt;
  final String updatedAt;

  factory UserServiceOption.fromJson(Map<String, dynamic> json) =>
      _$UserServiceOptionFromJson(json);

  UserServiceOption({
    required this.id,
    required this.isActive,
    required this.isRequired,
    required this.relatedItems,
    required this.unit,
    required this.price,
    required this.questions,
    required this.lineNumber,
    required this.isTaxable,
    required this.userService,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.description,
  });

  Map<String, dynamic> toJson() => _$UserServiceOptionToJson(this);
}
