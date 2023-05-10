//

import 'package:artisan/core/models/service/service.dart';
import 'package:artisan/fakedata/sub_professions.dart';

import '../core/models/item_service/item_service.dart';

final List<Service> servicesData = [
  Service(
      id: "2ef6023f-a466-4018-8a49-a68343c67cc2",
      name: 'Fabrication chaises et tables',
      createdAt: "${2023 - 02 - 16}",
      updatedAt: "${2023 - 02 - 16}",
      subProfession: subProfessions[0],
      isActive: true,
      itemServices: [],
      publishedOn: "${2023 - 02 - 16}",
      referenceNumber: '20222022',
      description:
          'Non esse aliqua anim officia. Velit exercitation quis et anim labore qui. Amet culpa fugiat dolor ex incididunt dolor incididunt aliqua nostrud officia pariatur. Ea proident eiusmod ullamco officia consequat. Officia exercitation in aliqua do commodo. Minim est proident voluptate deserunt cupidatat voluptate exercitation enim tempor.'),
  Service(
      id: "a7644796-b01f-4531-8d9d-cacaa47e6353",
      name: "Fabrication gueridon",
      createdAt: "${2023 - 02 - 16}",
      updatedAt: "${2023 - 02 - 16}",
      subProfession: subProfessions[0],
      isActive: true,
      itemServices: [],
      publishedOn: "${2023 - 02 - 07}",
      referenceNumber: '102022',
      description:
          'Nostrud enim ullamco esse ullamco incididunt adipisicing cupidatat eu anim sunt consequat. Do sunt ut culpa sunt sint. Id aliquip cupidatat ea ullamco deserunt. Cupidatat duis et ut occaecat minim.'),
  Service(
      id: '64c9487e-ddb3-4a30-8957-442e47d2c4d7',
      name: 'Fabrication fauteuil',
      createdAt: "${2023 - 02 - 07}",
      updatedAt: "${2023 - 02 - 07}",
      subProfession: subProfessions[0],
      isActive: true,
      itemServices: <ItemService>[],
      publishedOn: "${2023 - 02 - 07}",
      referenceNumber: '20222022',
      description:
          'Non esse aliqua anim officia. Velit exercitation quis et anim labore qui. Amet culpa fugiat dolor ex incididunt dolor incididunt aliqua nostrud officia pariatur. Ea proident eiusmod ullamco officia consequat. Officia exercitation in aliqua do commodo. Minim est proident voluptate deserunt cupidatat voluptate exercitation enim tempor.'),
  Service(
      id: 'a5c889a1-499a-4fee-905b-10bc03a4ca36',
      name: 'Peinture simple sans dessin',
      createdAt: "${2023 - 02 - 07}",
      updatedAt: "${2023 - 02 - 07}",
      subProfession: subProfessions[8],
      isActive: true,
      itemServices: <ItemService>[],
      publishedOn: "${2023 - 02 - 07}",
      referenceNumber: '20222022',
      description:
          'Non esse aliqua anim officia. Velit exercitation quis et anim labore qui. Amet culpa fugiat dolor ex incididunt dolor incididunt aliqua nostrud officia pariatur. Ea proident eiusmod ullamco officia consequat. Officia exercitation in aliqua do commodo. Minim est proident voluptate deserunt cupidatat voluptate exercitation enim tempor.'),
];
