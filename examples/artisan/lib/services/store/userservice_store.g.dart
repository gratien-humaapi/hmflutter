// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userservice_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserServiceStore on _UserServiceStore, Store {
  late final _$servicesAtom =
      Atom(name: '_UserServiceStore.services', context: context);

  @override
  ObservableList<UserService> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(ObservableList<UserService> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  late final _$_UserServiceStoreActionController =
      ActionController(name: '_UserServiceStore', context: context);

  @override
  void userServices() {
    final _$actionInfo = _$_UserServiceStoreActionController.startAction(
        name: '_UserServiceStore.userServices');
    try {
      return super.userServices();
    } finally {
      _$_UserServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refreshData() {
    final _$actionInfo = _$_UserServiceStoreActionController.startAction(
        name: '_UserServiceStore.refreshData');
    try {
      return super.refreshData();
    } finally {
      _$_UserServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
services: ${services}
    ''';
  }
}
