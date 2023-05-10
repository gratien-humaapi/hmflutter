// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceStore on _ServiceStore, Store {
  late final _$partialServicesAtom =
      Atom(name: '_ServiceStore.partialServices', context: context);

  @override
  ObservableList<Service> get partialServices {
    _$partialServicesAtom.reportRead();
    return super.partialServices;
  }

  @override
  set partialServices(ObservableList<Service> value) {
    _$partialServicesAtom.reportWrite(value, super.partialServices, () {
      super.partialServices = value;
    });
  }

  late final _$_ServiceStoreActionController =
      ActionController(name: '_ServiceStore', context: context);

  @override
  void services(String subProfessionId) {
    final _$actionInfo = _$_ServiceStoreActionController.startAction(
        name: '_ServiceStore.services');
    try {
      return super.services(subProfessionId);
    } finally {
      _$_ServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<ItemService> prestations(String serviceId) {
    final _$actionInfo = _$_ServiceStoreActionController.startAction(
        name: '_ServiceStore.prestations');
    try {
      return super.prestations(serviceId);
    } finally {
      _$_ServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Service service(String id) {
    final _$actionInfo = _$_ServiceStoreActionController.startAction(
        name: '_ServiceStore.service');
    try {
      return super.service(id);
    } finally {
      _$_ServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Service serviceByName(String name) {
    final _$actionInfo = _$_ServiceStoreActionController.startAction(
        name: '_ServiceStore.serviceByName');
    try {
      return super.serviceByName(name);
    } finally {
      _$_ServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
partialServices: ${partialServices}
    ''';
  }
}
