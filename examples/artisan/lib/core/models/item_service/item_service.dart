import 'package:artisan/core/models/service/service.dart';
import 'package:artisan/core/models/sub_profession/sub_profession.dart';
import 'package:json_annotation/json_annotation.dart';

import '../item_service_option/item_service_option.dart';

part 'item_service.g.dart';

@JsonSerializable()
class ItemService {
  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final String referenceNumber;
  final Service service;
  final SubProfession subProfession;
  final List<ItemServiceOption> options;
  final String createdAt;
  final String updatedAt;

  factory ItemService.fromJson(Map<String, dynamic> json) =>
      _$ItemServiceFromJson(json);

  ItemService({
    required this.id,
    required this.name,
    required this.isActive,
    required this.referenceNumber,
    required this.service,
    required this.subProfession,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
    this.description,
  });

  Map<String, dynamic> toJson() => _$ItemServiceToJson(this);
}
