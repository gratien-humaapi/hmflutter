import 'package:json_annotation/json_annotation.dart';

import '../profession/profession.dart';

part 'sub_profession.g.dart';

@JsonSerializable()
class SubProfession {
  final String id;
  final String name;
  final String? description;
  final Profession profession;
  // final List<Service> services;
  // final List<User>? users;
  final String createdAt;
  final String updatedAt;

  factory SubProfession.fromJson(Map<String, dynamic> json) =>
      _$SubProfessionFromJson(json);

  SubProfession({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.profession,
  });

  Map<String, dynamic> toJson() => _$SubProfessionToJson(this);
}
