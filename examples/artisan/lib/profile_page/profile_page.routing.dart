import 'package:artisan/portfolio/portfolio.dart';
import 'package:artisan/settings/settings.dart';
import 'package:artisan/subscription/subscription.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.routing.dart';
import 'profile_page.dart';

// part 'profile_page.routing.g.dart';

// @TypedGoRoute<ProfilePageRoute>(
//   path: '/profile',
// routes: [
//   TypedGoRoute<SubscriptionPageRoute>(
//     path: 'subscription',
//   ),
//   TypedGoRoute<PorfolioPageRoute>(
//     path: 'porfolio',
//   ),
//   TypedGoRoute<SettingsPageRoute>(
//     path: 'settings',
//   ),
// ],
// )
// @immutable
class ProfilePageRoute extends GoRouteData {
  // Without this static key, the page will not cover the bottomNavBar.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ProfilePage());
  }
}

@immutable
class SubscriptionPageRoute extends GoRouteData {
  // Without this static key, the page will not cover the bottomNavBar.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SubscriptionPage());
  }
}

@immutable
class PorfolioPageRoute extends GoRouteData {
  // Without this static key, the page will not cover the bottomNavBar.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: Portfolio());
  }
}

@immutable
class SettingsPageRoute extends GoRouteData {
  // Without this static key, the page will not cover the bottomNavBar.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SettingsPage());
  }
}
