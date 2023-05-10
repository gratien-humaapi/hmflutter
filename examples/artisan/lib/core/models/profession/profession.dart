import 'package:json_annotation/json_annotation.dart';

part 'profession.g.dart';

@JsonSerializable()
class Profession {
  final String id;
  final String name;
  final String? description;
  // final List<SubProfession> subProfessions;
  final String createdAt;
  final String updatedAt;

  factory Profession.fromJson(Map<String, dynamic> json) =>
      _$ProfessionFromJson(json);

  Profession({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    // required this.subProfessions,
  });

  Map<String, dynamic> toJson() => _$ProfessionToJson(this);
}
