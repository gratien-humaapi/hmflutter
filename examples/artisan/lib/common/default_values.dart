import 'package:artisan/core/models/address/address.dart';
import 'package:artisan/core/models/contact/contact.dart';
import 'package:artisan/core/models/profession/profession.dart';
import 'package:artisan/core/models/sub_profession/sub_profession.dart';
import 'package:artisan/core/models/user/user_class.dart';

final defaultUser = User(
  id: '',
  status: '',
  verified: false,
  userType: '',
  createdAt: '',
  updatedAt: '',
  job: SubProfession(
    id: '',
    name: '',
    createdAt: '',
    updatedAt: '',
    profession: Profession(id: '', name: '', createdAt: '', updatedAt: ''),
  ),
  address: Address(),
  contact: Contact(
      firstName: '',
      lastName: '',
      email: '',
      verifiedEmail: false,
      acceptTOS: false,
      language: '',
      phone: ''),
  addressOfTheCompany: Address(),
  areaOfIntervention: Address(),
  bio: '',
  professionalNumber: '',
);
