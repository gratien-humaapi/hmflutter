//

import '../core/models/profession/profession.dart';

final List<Profession> professions = [
  Profession(
    id: "6bad467a-b071-4f05-9151-f4b3d1f886c5",
    name: "Menuiserie",
    createdAt: "2023 - 02 - 05",
    updatedAt: "2023 - 02 - 05",
    // subProfessions: subProfessions
    //     .where(
    //         (element) => element.profession.name.toLowerCase() == "menuiserie")
    //     .toList(),
  ),
  Profession(
    id: "a3ecb1d9-4ea7-44fb-9886-554d8d317780",
    name: "Peinture",
    createdAt: "2023 - 02 - 07",
    updatedAt: "2023 - 02 - 07",
    // subProfessions: subProfessions
    //     .where((element) => element.profession.name.toLowerCase() == "peinture")
    //     .toList(),
  ),
];
