// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      verifiedEmail: json['verifiedEmail'] as bool,
      acceptTOS: json['acceptTOS'] as bool,
      language: json['language'] as String,
      facebook: json['facebook'] as String?,
      linkedin: json['linkedin'] as String?,
      viadeo: json['viadeo'] as String?,
      phone: json['phone'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'verifiedEmail': instance.verifiedEmail,
      'acceptTOS': instance.acceptTOS,
      'language': instance.language,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'viadeo': instance.viadeo,
      'phone': instance.phone,
      'image': instance.image,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Contact on _Contact, Store {
  Computed<String>? _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??=
          Computed<String>(() => super.fullName, name: '_Contact.fullName'))
      .value;

  late final _$firstNameAtom =
      Atom(name: '_Contact.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom = Atom(name: '_Contact.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$emailAtom = Atom(name: '_Contact.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$verifiedEmailAtom =
      Atom(name: '_Contact.verifiedEmail', context: context);

  @override
  bool get verifiedEmail {
    _$verifiedEmailAtom.reportRead();
    return super.verifiedEmail;
  }

  @override
  set verifiedEmail(bool value) {
    _$verifiedEmailAtom.reportWrite(value, super.verifiedEmail, () {
      super.verifiedEmail = value;
    });
  }

  late final _$acceptTOSAtom =
      Atom(name: '_Contact.acceptTOS', context: context);

  @override
  bool get acceptTOS {
    _$acceptTOSAtom.reportRead();
    return super.acceptTOS;
  }

  @override
  set acceptTOS(bool value) {
    _$acceptTOSAtom.reportWrite(value, super.acceptTOS, () {
      super.acceptTOS = value;
    });
  }

  late final _$languageAtom = Atom(name: '_Contact.language', context: context);

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$facebookAtom = Atom(name: '_Contact.facebook', context: context);

  @override
  String? get facebook {
    _$facebookAtom.reportRead();
    return super.facebook;
  }

  @override
  set facebook(String? value) {
    _$facebookAtom.reportWrite(value, super.facebook, () {
      super.facebook = value;
    });
  }

  late final _$linkedinAtom = Atom(name: '_Contact.linkedin', context: context);

  @override
  String? get linkedin {
    _$linkedinAtom.reportRead();
    return super.linkedin;
  }

  @override
  set linkedin(String? value) {
    _$linkedinAtom.reportWrite(value, super.linkedin, () {
      super.linkedin = value;
    });
  }

  late final _$viadeoAtom = Atom(name: '_Contact.viadeo', context: context);

  @override
  String? get viadeo {
    _$viadeoAtom.reportRead();
    return super.viadeo;
  }

  @override
  set viadeo(String? value) {
    _$viadeoAtom.reportWrite(value, super.viadeo, () {
      super.viadeo = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_Contact.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$imageAtom = Atom(name: '_Contact.image', context: context);

  @override
  String? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
email: ${email},
verifiedEmail: ${verifiedEmail},
acceptTOS: ${acceptTOS},
language: ${language},
facebook: ${facebook},
linkedin: ${linkedin},
viadeo: ${viadeo},
phone: ${phone},
image: ${image},
fullName: ${fullName}
    ''';
  }
}
