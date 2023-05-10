import 'package:flutter/material.dart';

/// FieldProps base class
class PropsBase {
  /// Indicates whether the field will be disabled or not.
  /// Default to false
  final bool disabled;

  /// Indicates whether the field will be hidden or not.
  /// Default to false
  final bool hidden;
  PropsBase({this.disabled = false, this.hidden = false});
}
