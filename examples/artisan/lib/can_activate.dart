import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

FutureOr<String?> canActive(BuildContext context, GoRouterState state,
    List<Function(BuildContext context, GoRouterState state)> guards) async {
  print("starting guard...");

  String? path;
  int i = 0;
  for (var guard in guards) {
    print("$i");
    path = await guard(context, state);
    i++;
    if (path != null) {
      break;
    }
  }

  print("End");

  return path;
}
