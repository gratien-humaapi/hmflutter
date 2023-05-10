import 'package:artisan/core/models/service/service.dart';
import 'package:json_annotation/json_annotation.dart';

import '../user_service_option/user_service_option.dart';

part 'user_service.g.dart';

@JsonSerializable()
class UserService {
  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final String referenceNumber;
  final String status;
  final String owner;
  final Service service;
  final String updatedBy;
  final String tarification;
  final String tarifMinimum;
  final String? serviceImage;
  final List<String> reviewers;
  final List<UserServiceOption> options;
  final String createdAt;
  final String updatedAt;

  factory UserService.fromJson(Map<String, dynamic> json) =>
      _$UserServiceFromJson(json);

  UserService({
    required this.id,
    required this.name,
    required this.status,
    this.serviceImage,
    required this.owner,
    required this.tarification,
    required this.tarifMinimum,
    required this.service,
    required this.updatedBy,
    required this.reviewers,
    required this.options,
    required this.isActive,
    required this.referenceNumber,
    required this.createdAt,
    required this.updatedAt,
    this.description,
  });

  Map<String, dynamic> toJson() => _$UserServiceToJson(this);
}
