import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact extends _Contact with _$Contact {
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Contact({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.verifiedEmail,
    required super.acceptTOS,
    required super.language,
    super.facebook,
    super.linkedin,
    super.viadeo,
    required super.phone,
    super.image,
  });

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

//
abstract class _Contact with Store {
  @observable
  String firstName;
  @observable
  String lastName;
  @observable
  String email;
  @observable
  bool verifiedEmail;
  @observable
  bool acceptTOS;
  @observable
  String language;
  @observable
  String? facebook;
  @observable
  String? linkedin;
  @observable
  String? viadeo;
  @observable
  String phone;
  @observable
  // Add final when use the backend.
  String? image;

  @computed
  String get fullName => "$firstName $lastName";

  _Contact({
    required this.acceptTOS,
    required this.email,
    required this.firstName,
    required this.language,
    required this.lastName,
    required this.phone,
    required this.verifiedEmail,
    this.image,
    this.linkedin,
    this.facebook,
    this.viadeo,
  });
}
