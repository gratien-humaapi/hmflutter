//
import 'package:artisan/auth/store/user_store.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/user_service/user_service.dart';

part 'userservice_store.g.dart';

@Singleton()
class UserServiceStore = _UserServiceStore with _$UserServiceStore;

abstract class _UserServiceStore with Store {
  final UserStore userStore;

  _UserServiceStore(this.userStore);

  @observable
  ObservableList<UserService> services = ObservableList<UserService>();

  @action
  void userServices() {
    final servicesList = userStore.userServices;
    services = ObservableList.of(servicesList);
    // return servicesList;
  }

  @action
  void refreshData() {
    userServices();
  }
}
