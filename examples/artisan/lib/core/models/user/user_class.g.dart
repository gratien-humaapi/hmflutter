// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      status: json['status'] as String,
      verified: json['verified'] as bool,
      createdAt: json['createdAt'] as String,
      professionalNumber: json['professionalNumber'] as String,
      bio: json['bio'] as String,
      areaOfIntervention:
          Address.fromJson(json['areaOfIntervention'] as Map<String, dynamic>),
      addressOfTheCompany:
          Address.fromJson(json['addressOfTheCompany'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String,
      contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      userType: json['userType'] as String,
      job: SubProfession.fromJson(json['job'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'verified': instance.verified,
      'contact': instance.contact,
      'address': instance.address,
      'userType': instance.userType,
      'professionalNumber': instance.professionalNumber,
      'bio': instance.bio,
      'areaOfIntervention': instance.areaOfIntervention,
      'addressOfTheCompany': instance.addressOfTheCompany,
      'job': instance.job,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$User on _User, Store {
  late final _$idAtom = Atom(name: '_User.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$statusAtom = Atom(name: '_User.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$verifiedAtom = Atom(name: '_User.verified', context: context);

  @override
  bool get verified {
    _$verifiedAtom.reportRead();
    return super.verified;
  }

  @override
  set verified(bool value) {
    _$verifiedAtom.reportWrite(value, super.verified, () {
      super.verified = value;
    });
  }

  late final _$contactAtom = Atom(name: '_User.contact', context: context);

  @override
  Contact get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(Contact value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$addressAtom = Atom(name: '_User.address', context: context);

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$userTypeAtom = Atom(name: '_User.userType', context: context);

  @override
  String get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(String value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  late final _$professionalNumberAtom =
      Atom(name: '_User.professionalNumber', context: context);

  @override
  String get professionalNumber {
    _$professionalNumberAtom.reportRead();
    return super.professionalNumber;
  }

  @override
  set professionalNumber(String value) {
    _$professionalNumberAtom.reportWrite(value, super.professionalNumber, () {
      super.professionalNumber = value;
    });
  }

  late final _$bioAtom = Atom(name: '_User.bio', context: context);

  @override
  String get bio {
    _$bioAtom.reportRead();
    return super.bio;
  }

  @override
  set bio(String value) {
    _$bioAtom.reportWrite(value, super.bio, () {
      super.bio = value;
    });
  }

  late final _$areaOfInterventionAtom =
      Atom(name: '_User.areaOfIntervention', context: context);

  @override
  Address get areaOfIntervention {
    _$areaOfInterventionAtom.reportRead();
    return super.areaOfIntervention;
  }

  @override
  set areaOfIntervention(Address value) {
    _$areaOfInterventionAtom.reportWrite(value, super.areaOfIntervention, () {
      super.areaOfIntervention = value;
    });
  }

  late final _$addressOfTheCompanyAtom =
      Atom(name: '_User.addressOfTheCompany', context: context);

  @override
  Address get addressOfTheCompany {
    _$addressOfTheCompanyAtom.reportRead();
    return super.addressOfTheCompany;
  }

  @override
  set addressOfTheCompany(Address value) {
    _$addressOfTheCompanyAtom.reportWrite(value, super.addressOfTheCompany, () {
      super.addressOfTheCompany = value;
    });
  }

  late final _$jobAtom = Atom(name: '_User.job', context: context);

  @override
  SubProfession get job {
    _$jobAtom.reportRead();
    return super.job;
  }

  @override
  set job(SubProfession value) {
    _$jobAtom.reportWrite(value, super.job, () {
      super.job = value;
    });
  }

  late final _$createdAtAtom = Atom(name: '_User.createdAt', context: context);

  @override
  String get createdAt {
    _$createdAtAtom.reportRead();
    return super.createdAt;
  }

  @override
  set createdAt(String value) {
    _$createdAtAtom.reportWrite(value, super.createdAt, () {
      super.createdAt = value;
    });
  }

  late final _$updatedAtAtom = Atom(name: '_User.updatedAt', context: context);

  @override
  String get updatedAt {
    _$updatedAtAtom.reportRead();
    return super.updatedAt;
  }

  @override
  set updatedAt(String value) {
    _$updatedAtAtom.reportWrite(value, super.updatedAt, () {
      super.updatedAt = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
status: ${status},
verified: ${verified},
contact: ${contact},
address: ${address},
userType: ${userType},
professionalNumber: ${professionalNumber},
bio: ${bio},
areaOfIntervention: ${areaOfIntervention},
addressOfTheCompany: ${addressOfTheCompany},
job: ${job},
createdAt: ${createdAt},
updatedAt: ${updatedAt}
    ''';
  }
}
