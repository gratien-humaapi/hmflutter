import '../app.routing.dart';
import 'package:artisan/services/update_service.dart';
import 'package:artisan/services/services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/modal_page.dart';
import 'create_service.dart';

class ServicesPageRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ServicesPage());
  }
}

class UpdateServiceRoute extends GoRouteData {
  const UpdateServiceRoute({required this.id});

  // Without this static key, the dialog will not cover the navigation rail.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ModalPage(child: UpdateService(id: id));
  }
}

class CreateServiceRoute extends GoRouteData {
  final bool hasBackButton;
  CreateServiceRoute({this.hasBackButton = true});
  // Without this static key, the dialog will not cover the navigation rail.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: CreateService(hasBackButton: hasBackButton),
    );
  }
}
