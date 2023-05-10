import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.routing.dart';
import 'message_page.dart';
import 'message_screen.dart';

class MessagesPageRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: MessagePage());
  }
}

class MessagePageRoute extends GoRouteData {
  const MessagePageRoute({required this.id});

  // Without this static key, the dialog will not cover the navigation rail.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: ChatScreen(id: id));
  }
}
