import 'package:artisan/more_info/add_profil_image.dart';
import 'package:artisan/more_info/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'more_info.dart';

part 'more_info.routing.g.dart';

@TypedGoRoute<MoreInfoRoute>(
  path: '/more-info',
  routes: [
    TypedGoRoute<WelcomeRoute>(
      path: 'welcome',
    ),
    TypedGoRoute<AddProfileImageRoute>(
      path: 'profile-image',
    ),
  ],
)
@immutable
class MoreInfoRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: MoreInfo());
  }
}

@immutable
class WelcomeRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: WelcomePage());
  }
}

@immutable
class AddProfileImageRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: AddProfileImage());
  }
}
