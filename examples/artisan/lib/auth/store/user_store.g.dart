// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<List<UserService>>? _$userServicesComputed;

  @override
  List<UserService> get userServices => (_$userServicesComputed ??=
          Computed<List<UserService>>(() => super.userServices,
              name: '_UserStore.userServices'))
      .value;
  Computed<User>? _$userComputed;

  @override
  User get user => (_$userComputed ??=
          Computed<User>(() => super.user, name: '_UserStore.user'))
      .value;

  late final _$_userAtom = Atom(name: '_UserStore._user', context: context);

  @override
  User get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(User value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$_userServicesAtom =
      Atom(name: '_UserStore._userServices', context: context);

  @override
  ObservableList<UserService> get _userServices {
    _$_userServicesAtom.reportRead();
    return super._userServices;
  }

  @override
  set _userServices(ObservableList<UserService> value) {
    _$_userServicesAtom.reportWrite(value, super._userServices, () {
      super._userServices = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void saveUser(User newUser) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.saveUser');
    try {
      return super.saveUser(newUser);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addService(UserService userService) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.addService');
    try {
      return super.addService(userService);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeService(String serviceId) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.removeService');
    try {
      return super.removeService(serviceId);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addProfileImage(String path) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.addProfileImage');
    try {
      return super.addProfileImage(path);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editProfile(Map<String, dynamic> input) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.editProfile');
    try {
      return super.editProfile(input);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userServices: ${userServices},
user: ${user}
    ''';
  }
}
