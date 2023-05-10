import 'package:artisan/core/models/sub_profession/sub_profession.dart';
import 'package:json_annotation/json_annotation.dart';

import '../item_service/item_service.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final String referenceNumber;
  final String publishedOn;
  final SubProfession subProfession;
  final List<ItemService> itemServices;
  final String createdAt;
  final String updatedAt;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Service({
    required this.id,
    required this.name,
    required this.isActive,
    required this.referenceNumber,
    required this.publishedOn,
    required this.subProfession,
    required this.itemServices,
    required this.createdAt,
    required this.updatedAt,
    this.description,
  });

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
