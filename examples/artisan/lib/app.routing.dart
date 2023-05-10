//
import 'package:artisan/appshell/appshell_routes.dart';
import 'package:artisan/auth/auth.routing.dart';
import 'package:artisan/more_info/more_info.routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth/auth_service.dart';
import 'can_activate.dart';
import 'core/useservice.dart';

homeGuard(BuildContext context, GoRouterState state) async {
  print('the location ${state.location}');
  final AuthService authService = useService<AuthService>();
  final bool isLogging = state.location.contains('/auth');

  Future<String> getToken() async {
    final String token = authService.accessToken;
    if (token.isEmpty) {
      await authService.refreshToken();
      return authService.accessToken;
    }
    return token;
  }

  Future<String?> isConnected() async {
    final accessToken = await getToken();

    if (accessToken.isEmpty) {
      return '/auth';
    } else {
      return null;
    }
  }

  if (isLogging) {
    return null;
  }

  final String? path = await isConnected();

  print(path);
  return path;
}

profileGuard(BuildContext context, GoRouterState state) {
  print("profileGuard: ${state.location}");
  return null;
}

serviceGuard(BuildContext context, GoRouterState state) {
  print("serviceGuard : ${state.location}");
  return null;
}

var a = GoRoute(
  path: "",
);

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: "/auth", //"/more-info",
  routes: [
    $authRoute,
    $moreInfoRoute,
    $appShellRoute,
  ],

  // redirect: (BuildContext context, GoRouterState state) =>
  //     canActive(context, state, [homeGuard, profileGuard, serviceGuard]),

  // redirect: (BuildContext context, GoRouterState state) async {
  // print('the location ${state.location}');
  // final AuthService authService = useService<AuthService>();
  // final bool isLogging = state.location.contains('/auth');
  // Future<String> getToken() async {
  //   final String token = authService.accessToken;
  //   print('searching ...');
  //   if (token.isEmpty) {
  //     await authService.refreshToken();
  //     return authService.accessToken;
  //   }
  //   return token;
  // }

  // isConnected() async {
  //   final accessToken = await getToken();

  //   if (accessToken.isEmpty) {
  //     return '/auth';
  //   } else {
  //     return state.location;
  //   }
  // }

  // if (isLogging) {
  //   return state.location;
  // }

  // final path = await isConnected();

  // print(path);
  // return path;
  // },
);
