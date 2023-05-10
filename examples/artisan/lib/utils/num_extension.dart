import 'package:flutter/material.dart';

extension EmptyPadding on num {
  SizedBox get py => SizedBox(height: toDouble());
  SizedBox get px => SizedBox(width: toDouble());
}
