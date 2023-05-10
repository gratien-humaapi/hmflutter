import 'package:artisan/fakedata/services.dart';
import 'package:artisan/fakedata/sub_professions.dart';
import 'package:uuid/uuid.dart';

import '../core/models/item_service/item_service.dart';

List<ItemService> itemServices = [
  ItemService(
      id: const Uuid().v4(),
      name: "Fabrication d'une table en bois massif",
      isActive: true,
      referenceNumber: "123456B",
      service: servicesData[0],
      subProfession: subProfessions[0],
      options: [],
      createdAt: "${DateTime.now()}",
      updatedAt: "${DateTime.now()}"),
  ItemService(
      id: const Uuid().v4(),
      name: "Création d'une armoire de rangement sur mesure",
      isActive: true,
      referenceNumber: "123456A",
      service: servicesData[0],
      subProfession: subProfessions[0],
      options: [],
      createdAt: "${DateTime.now()}",
      updatedAt: "${DateTime.now()}"),
  ItemService(
      id: const Uuid().v4(),
      name: "Création d'un gueridon",
      isActive: true,
      referenceNumber: "123456A",
      service: servicesData[1],
      subProfession: subProfessions[1],
      options: [],
      createdAt: "${DateTime.now()}",
      updatedAt: "${DateTime.now()}"),
];
