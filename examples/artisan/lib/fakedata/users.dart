//

import 'package:artisan/core/models/contact/contact.dart';
import 'package:artisan/core/enums/language_enum.dart';
import 'package:artisan/core/enums/user_status.dart';
import 'package:artisan/core/enums/user_type.dart';
import 'package:artisan/fakedata/sub_professions.dart';

import '../core/models/address/address.dart';
import '../core/models/user/user_class.dart';

List<User> usersList = [
  User(
      id: "0532bdbb-d90d-4ab5-b209-dbd0c6266abd",
      status: UserStatusEnum.active.value,
      verified: true,
      createdAt: "2023 - 02 - 16",
      updatedAt: "2023 - 02 - 16",
      contact: Contact(
        firstName: 'Paul',
        lastName: "Heyman",
        email: "gratien.adn@gmail.com",
        verifiedEmail: true,
        acceptTOS: true,
        language: LanguageEnum.french.name,
        phone: '+123456445445',
      ),
      address: Address(
          address1: "Cotonou",
          address2: "Calavi",
          city: "Cotonou",
          country: "Benin",
          countryCode: "bj",
          latitude: "22°N",
          longitude: "120°E",
          name: "Cotonou",
          province: "12300",
          provinceCode: "20312",
          zip: "0235"),
      userType: UserTypeEnum.contractor.value,
      job: subProfessions.first,
      addressOfTheCompany: Address(
          address1: "Calavi",
          address2: "Cotonou",
          city: "Calavi",
          country: "Benin",
          countryCode: "bj",
          latitude: "22°N",
          longitude: "120°E",
          name: "Cotonou",
          province: "12300",
          provinceCode: "20312",
          zip: "0235"),
      areaOfIntervention: Address(),
      bio: 'Travailleur, aime son métier',
      professionalNumber: 'A2001122'),
  User(
      id: "d292f94b-235e-486a-85a6-0ff53a80b8a6",
      status: UserStatusEnum.active.value,
      verified: true,
      createdAt: "2023 - 02 - 16",
      updatedAt: "2023 - 02 - 17",
      contact: Contact(
          firstName: 'Bruce',
          lastName: "Lee",
          email: "bruce@gmail.com",
          verifiedEmail: true,
          acceptTOS: true,
          language: LanguageEnum.english.name,
          phone: '+229 45456585'),
      address: Address(
          address1: "Porto-Novo",
          address2: "Cotonou",
          city: "Porto-Novo",
          country: "Benin",
          countryCode: "bj",
          latitude: "22°N",
          longitude: "120°E",
          name: "Porto-Novo",
          province: "12300",
          provinceCode: "20312",
          zip: "0235"),
      userType: UserTypeEnum.contractor.value,
      job: subProfessions.last,
      addressOfTheCompany: Address(
          address1: "Cotonou",
          address2: "Porto-Novo",
          city: "Cotonou",
          country: "Benin",
          countryCode: "bj",
          latitude: "22°N",
          longitude: "120°E",
          name: "Porto-Novo",
          province: "12300",
          provinceCode: "20312",
          zip: "0235"),
      areaOfIntervention: Address(),
      bio: 'Travailleur, aime son métier',
      professionalNumber: 'A2001122'),
];
