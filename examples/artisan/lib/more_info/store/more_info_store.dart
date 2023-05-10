//
import 'package:artisan/core/models/address/address.dart';
import 'package:artisan/core/models/sub_profession/sub_profession.dart';
import 'package:artisan/fakedata/address.dart';
import 'package:artisan/fakedata/sub_professions.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'more_info_store.g.dart';

@Singleton()
class MoreInfoStore = _MoreInfoStore with _$MoreInfoStore;

abstract class _MoreInfoStore with Store {
  @observable
  ObservableList<SubProfession> partialSubProfessions =
      ObservableList<SubProfession>();

  @action
  List<SubProfession> getSubProfessionList() {
    return subProfessions;
  }

  @action
  Address getAddressById(String city) {
    final Address address =
        addressList.firstWhere((element) => element.city == city);
    return address;
  }

  @action
  SubProfession getSubProfession(String name) {
    final SubProfession subProfession =
        subProfessions.firstWhere((element) => element.name == name);
    return subProfession;
  }

  @action
  void getSubProfessionsByName(String name) {
    final List<SubProfession> subProfessionsByName =
        subProfessions.where((element) => element.name == name).toList();
    partialSubProfessions.clear();
    partialSubProfessions.addAll(subProfessionsByName);
  }
  // _MoreInfoStore();
}
