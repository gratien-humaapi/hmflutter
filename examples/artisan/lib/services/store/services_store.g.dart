// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServicesStore on _ServicesStore, Store {
  late final _$partialServicesAtom =
      Atom(name: '_ServicesStore.partialServices', context: context);

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

  late final _$_ServicesStoreActionController =
      ActionController(name: '_ServicesStore', context: context);

  @override
  void loadData(String subProfessionId) {
    final _$actionInfo = _$_ServicesStoreActionController.startAction(
        name: '_ServicesStore.loadData');
    try {
      return super.loadData(subProfessionId);
    } finally {
      _$_ServicesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refreshData(String subProfessionId) {
    final _$actionInfo = _$_ServicesStoreActionController.startAction(
        name: '_ServicesStore.refreshData');
    try {
      return super.refreshData(subProfessionId);
    } finally {
      _$_ServicesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
partialServices: ${partialServices}
    ''';
  }
}
