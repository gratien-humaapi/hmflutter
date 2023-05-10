//
import 'package:artisan/core/models/item_service/item_service.dart';
import 'package:artisan/core/models/service/service.dart';
import 'package:artisan/core/models/sub_profession/sub_profession.dart';
import 'package:artisan/fakedata/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/user_service/user_service.dart';
import '../../fakedata/item_services.dart';

part 'service_store.g.dart';

@Singleton()
class ServiceStore = _ServiceStore with _$ServiceStore;

abstract class _ServiceStore with Store {
  @observable
  ObservableList<Service> partialServices = ObservableList<Service>();

  // Ne reflect pas le changement dans le rendu
  // @observable
  // ObservableList<ItemService> partialItemServices =
  //     ObservableList<ItemService>();

  @action
  void services(String subProfessionId) {
    final servicesList = servicesData
        .where((element) => element.subProfession.id == subProfessionId)
        .toList();
    partialServices = ObservableList.of(servicesList);
    // return servicesList;
  }

  @action
  List<ItemService> prestations(String serviceId) {
    final List<ItemService> itemServicesList = itemServices
        .where((element) => element.service.id == serviceId)
        .toList();
    return itemServicesList;
    // partialItemServices = ObservableList<ItemService>.of(itemServicesList);
    // print(partialItemServices);
  }

  @action
  Service service(String id) {
    final Service service =
        servicesData.firstWhere((element) => element.id == id);
    return service;
  }

  @action
  Service serviceByName(String name) {
    final Service service =
        servicesData.firstWhere((element) => element.name == name);
    return service;
  }

  // @action
  // UserService getServiceById(String id) {
  //   final UserService service =
  //       partialUserServices.firstWhere((element) => element.id == id);
  //   return service;
  // }

  // @action
  // void getSubProfessionsByName(String name) {
  //   final List<SubProfession> subProfessionsByName =
  //       subProfessions.where((element) => element.name == name).toList();
  //   partialSubProfessions.clear();
  //   partialSubProfessions.addAll(subProfessionsByName);
  // }
  // ServiceStore();

  // @action
  // UserService getServiceById(String id) {
  //   final UserService service =
  //       partialUserServices.firstWhere((element) => element.id == id);
  //   return service;
  // }

  // @action
  // updateService(UserService newUserService) {
  //   final id = newUserService.id;
  //   final index =
  //       userStore.userServices.indexWhere((element) => element.id == id);
  //   if (index >= 0) {
  //     userStore.userServices[index] = newUserService;
  //   }
  // }

  // @action
  // deleteService(String serviceId) {
  //   userStore.removeService(serviceId);
  //   print('remove');
  // }

  // @action
  // void getSubProfessionsByName(String name) {
  //   final List<SubProfession> subProfessionsByName =
  //       subProfessions.where((element) => element.name == name).toList();
  //   partialSubProfessions.clear();
  //   partialSubProfessions.addAll(subProfessionsByName);
  // }
  // ServicesStore();
}
