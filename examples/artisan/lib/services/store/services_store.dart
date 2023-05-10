//
import 'package:artisan/auth/store/user_store.dart';
import 'package:artisan/core/models/user_service/user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/service/service.dart';
import '../../fakedata/services.dart';

part 'services_store.g.dart';

@Singleton()
class ServicesStore = _ServicesStore with _$ServicesStore;

abstract class _ServicesStore with Store {
  final UserStore userStore;

  _ServicesStore(this.userStore);

  @observable
  ObservableList<Service> partialServices = ObservableList<Service>();

  @action
  void loadData(String subProfessionId) {
    final List<Service> servicesList =
        servicesData.where((element) => element.id == subProfessionId).toList();
    partialServices = ObservableList.of(servicesList);
    // return servicesList;
  }

  @action
  void refreshData(String subProfessionId) {
    loadData(subProfessionId);
  }
}
