import 'package:artisan/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.routing.dart';

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HomePage());
  }

  // @override
  // Future<String> redirect(BuildContext context, GoRouterState state) {
  //   return;
  // }
}
