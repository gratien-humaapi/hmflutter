import 'package:json_annotation/json_annotation.dart';

import '../item_service/item_service.dart';
import '../question/question.dart';
import '../service_option_related_type/service_option_related_type.dart';

part 'item_service_option.g.dart';

@JsonSerializable()
class ItemServiceOption {
  final String id;
  final String name;
  final bool isRequired;
  final bool isActive;
  final List<ServiceOptionRelatedType> relatedItems;
  final String type;
  final List<Question> questions;
  final String unit;
  final String lineNumber;
  final ItemService itemService;
  final String createdAt;
  final String updatedAt;

  factory ItemServiceOption.fromJson(Map<String, dynamic> json) =>
      _$ItemServiceOptionFromJson(json);

  ItemServiceOption({
    required this.id,
    required this.isRequired,
    required this.relatedItems,
    required this.type,
    required this.questions,
    required this.unit,
    required this.lineNumber,
    required this.itemService,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() => _$ItemServiceOptionToJson(this);
}
