import 'package:artisan/core/models/sub_profession/sub_profession.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import '../address/address.dart';
import '../contact/contact.dart';

part 'user_class.g.dart';

@JsonSerializable()
class User extends _User with _$User {
  // final String id;
  // final String status;
  // final bool verified;
  // final Contact contact;
  // final Address address;
  // final String userType;
  // final String professionalNumber;
  // final String bio;
  // final Address areaOfIntervention;
  // final Address addressOfTheCompany;
  // final SubProfession job;
  // final String createdAt;
  // final String updatedAt;

  User({
    required super.id,
    required super.status,
    required super.verified,
    required super.createdAt,
    required super.professionalNumber,
    required super.bio,
    required super.areaOfIntervention,
    required super.addressOfTheCompany,
    required super.updatedAt,
    required super.contact,
    required super.address,
    required super.userType,
    required super.job,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

//
abstract class _User with Store {
  @observable
  String id;
  @observable
  String status;
  @observable
  bool verified;
  @observable
  Contact contact;
  @observable
  Address address;
  @observable
  String userType;
  @observable
  String professionalNumber;
  @observable
  String bio;
  @observable
  Address areaOfIntervention;
  @observable
  Address addressOfTheCompany;
  @observable
  SubProfession job;
  @observable
  String createdAt;
  @observable
  String updatedAt;

  _User({
    required this.id,
    required this.status,
    required this.address,
    required this.addressOfTheCompany,
    required this.areaOfIntervention,
    required this.bio,
    required this.contact,
    required this.createdAt,
    required this.job,
    required this.professionalNumber,
    required this.updatedAt,
    required this.userType,
    required this.verified,
  });
}
