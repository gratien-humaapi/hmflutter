import 'package:flutter/material.dart';

import 'hmform_builder.dart';

class HMReactiveProvider extends InheritedWidget {
  HMReactiveProvider(
      {super.key, required super.child, required this.registerField}) {
    // ignore: avoid_function_literals_in_foreach_calls
    registerField.forEach((register) => register(builder));
  }

  final builder = HMFormBuilder();
  final List<Function(HMFormBuilder builder)> registerField;

  static HMReactiveProvider of(BuildContext context) {
    final HMReactiveProvider? result =
        context.dependOnInheritedWidgetOfExactType<HMReactiveProvider>();
    assert(result != null, 'No HMReactiveProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant HMReactiveProvider oldWidget) =>
      registerField != oldWidget.registerField;
}
