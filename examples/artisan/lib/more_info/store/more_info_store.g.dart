// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoreInfoStore on _MoreInfoStore, Store {
  late final _$partialSubProfessionsAtom =
      Atom(name: '_MoreInfoStore.partialSubProfessions', context: context);

  @override
  ObservableList<SubProfession> get partialSubProfessions {
    _$partialSubProfessionsAtom.reportRead();
    return super.partialSubProfessions;
  }

  @override
  set partialSubProfessions(ObservableList<SubProfession> value) {
    _$partialSubProfessionsAtom.reportWrite(value, super.partialSubProfessions,
        () {
      super.partialSubProfessions = value;
    });
  }

  late final _$_MoreInfoStoreActionController =
      ActionController(name: '_MoreInfoStore', context: context);

  @override
  List<SubProfession> getSubProfessionList() {
    final _$actionInfo = _$_MoreInfoStoreActionController.startAction(
        name: '_MoreInfoStore.getSubProfessionList');
    try {
      return super.getSubProfessionList();
    } finally {
      _$_MoreInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Address getAddressById(String city) {
    final _$actionInfo = _$_MoreInfoStoreActionController.startAction(
        name: '_MoreInfoStore.getAddressById');
    try {
      return super.getAddressById(city);
    } finally {
      _$_MoreInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  SubProfession getSubProfession(String name) {
    final _$actionInfo = _$_MoreInfoStoreActionController.startAction(
        name: '_MoreInfoStore.getSubProfession');
    try {
      return super.getSubProfession(name);
    } finally {
      _$_MoreInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getSubProfessionsByName(String name) {
    final _$actionInfo = _$_MoreInfoStoreActionController.startAction(
        name: '_MoreInfoStore.getSubProfessionsByName');
    try {
      return super.getSubProfessionsByName(name);
    } finally {
      _$_MoreInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
partialSubProfessions: ${partialSubProfessions}
    ''';
  }
}
