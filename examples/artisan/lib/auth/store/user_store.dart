import 'package:artisan/fakedata/users.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/user/user_class.dart';
import '../../core/models/user_service/user_service.dart';

part 'user_store.g.dart';

@Singleton()
class UserStore = _UserStore with _$UserStore;
// class UserStore extends _UserStore with _$UserStore {
//   // UserStore();
// }

abstract class _UserStore with Store {
  // @observable
  // String firstName = "";
  // @observable
  // String lastName = "";
  // @observable
  // String email = "";
  // @observable
  // String job = "";
  // @observable
  // String phone = "";
  // @observable
  // String address = "";
  // @observable
  // bool isConnected = false;

  @observable
  User _user = usersList[0];

  @observable
  ObservableList<UserService> _userServices = ObservableList<UserService>();

  @computed
  List<UserService> get userServices => _userServices;

  @computed
  User get user => _user;

  @action
  void saveUser(User newUser) {
    // user = User.fromJson(newUser);
    _user = newUser;
    print("here is user : ${_user.toJson()}");
  }

  @action
  void addService(UserService userService) {
    // user = User.fromJson(newUser);
    _userServices.add(userService);
    print("here is userServices : $_userServices");
  }

  @action
  void removeService(String serviceId) {
    // user = User.fromJson(newUser);
    _userServices.removeWhere((service) => service.id == serviceId);
    print("here is userServices : $_userServices");
  }

  // Add profile image
  @action
  addProfileImage(String path) {
    print('add image');
    _user.contact.image = path;
  }

  // Change user
  @action
  editProfile(Map<String, dynamic> input) {
    print('edit profile');
    _user.contact.firstName = input['firstName'];
    _user.contact.lastName = input['lastName'];
  }
}
