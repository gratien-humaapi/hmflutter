import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String? name;
  final String? address1;
  final String? address2;
  final String? city;
  final String? zip;
  final String? province;
  final String? provinceCode;
  final String? country;
  final String? countryCode;
  final String? latitude;
  final String? longitude;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Address({
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.zip,
    this.province,
    this.provinceCode,
    this.country,
    this.countryCode,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
