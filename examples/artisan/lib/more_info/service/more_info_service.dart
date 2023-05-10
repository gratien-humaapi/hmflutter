//

import 'package:artisan/fakedata/address.dart';
import 'package:artisan/fakedata/sub_professions.dart';

import '../../core/models/address/address.dart';
import '../../core/models/sub_profession/sub_profession.dart';

class MoreInfoService {
  List<Address> getAddressList() {
    return addressList;
  }

  // Address byId
  Address getAddressById(String city) {
    final Address address =
        addressList.firstWhere((element) => element.city == city);
    return address;
  }

  List<SubProfession> getSubProfessionList() {
    return subProfessions;
  }

  SubProfession getSubProfessionById(String name) {
    final SubProfession subProfession =
        subProfessions.firstWhere((element) => element == name);
    return subProfession;
  }
  //
}
