import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.routing.dart';
import 'notification_page.dart';

// part 'notification_page.routing.g.dart';

// @TypedGoRoute<NotificationPageRoute>(path: '/notification')
// @immutable
class NotificationPageRoute extends GoRouteData {
  // Without this static key, the dialog will not cover the navigation rail.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: NotificationPage());
  }
}
