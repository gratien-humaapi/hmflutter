import 'package:json_annotation/json_annotation.dart';


part 'service_option_related_type.g.dart';

@JsonSerializable()
class ServiceOptionRelatedType {
  final String id;
  final List<String> relatedValues;
  final String lineNumber;

  factory ServiceOptionRelatedType.fromJson(Map<String, dynamic> json) =>
      _$ServiceOptionRelatedTypeFromJson(json);

  ServiceOptionRelatedType({
    required this.id,
    required this.lineNumber,
    required this.relatedValues,
  });

  Map<String, dynamic> toJson() => _$ServiceOptionRelatedTypeToJson(this);
}
