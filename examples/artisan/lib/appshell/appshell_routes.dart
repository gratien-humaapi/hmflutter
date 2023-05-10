import 'package:artisan/app.routing.dart';
import 'package:artisan/services/service.routing.dart';
import 'package:artisan/wallet/wallet.routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../homepage/homepage.routing.dart';
import '../message/message.routing.dart';
import '../notification/notification_page.routing.dart';
import '../profile_page/profile_page.routing.dart';
import 'appshell.dart';

part 'appshell_routes.g.dart';

@TypedShellRoute<AppShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomePageRoute>(
      path: '/',
      routes: <TypedGoRoute>[
        TypedGoRoute<NotificationPageRoute>(path: 'notifications'),
        TypedGoRoute<ProfilePageRoute>(
          path: 'profile',
          routes: [
            TypedGoRoute<SubscriptionPageRoute>(
              path: 'subscription',
            ),
            TypedGoRoute<PorfolioPageRoute>(
              path: 'portfolio',
            ),
            TypedGoRoute<SettingsPageRoute>(
              path: 'settings',
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<MessagesPageRoute>(
      path: '/messages',
      routes: <TypedGoRoute<MessagePageRoute>>[
        TypedGoRoute<MessagePageRoute>(path: ':id'),
      ],
    ),

    TypedGoRoute<ServicesPageRoute>(
      path: '/services',
      routes: <TypedGoRoute>[
        TypedGoRoute<CreateServiceRoute>(path: 'create-service'),
        TypedGoRoute<UpdateServiceRoute>(path: ':id'),
      ],
    ),
    TypedGoRoute<WalletPageRoute>(
      path: '/wallet',
    ),

    // TypedGoRoute<CreateServiceRoute>(
    //   path: '/create-service',
    //   routes: <TypedGoRoute<UserRouteData>>[
    //     TypedGoRoute<UserRouteData>(path: ':id'),
    //   ],
    // ),
  ],
)
class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page pageBuilder(
      BuildContext context, GoRouterState state, Widget navigator) {
    return NoTransitionPage(child: AppShell(child: navigator));
  }
}

// final shellRouter = ShellRoute(
//   navigatorKey: _shellNavigatorKey,
//   pageBuilder: (context, state, child) {
//     return NoTransitionPage(child: HomePage(child: child));
//   },
//   routes: [
//     // This screen is displayed on the ShellRoute's Navigator.
//     GoRoute(
//       path: '/',
//       parentNavigatorKey: _shellNavigatorKey,
//       pageBuilder: (context, state) =>
//           const NoTransitionPage(child: HomePage()),
//     ),
//     // Displayed ShellRoute's Navigator.
//     GoRoute(
//         path: '/messages',
//         parentNavigatorKey: _shellNavigatorKey,
//         pageBuilder: (BuildContext context, GoRouterState state) =>
//             const NoTransitionPage(child: MessagePage())
//         // routes: <RouteBase>[
//         //   // Displayed on the root Navigator by specifying the
//         //   // [parentNavigatorKey].
//         //   GoRoute(
//         //     path: 'details',
//         //     builder: (BuildContext context, GoRouterState state) {
//         //       return const DetailsScreen(label: 'B');
//         //     },
//         //   ),
//         // ],
//         ),
//     GoRoute(
//       path: '/services',
//       parentNavigatorKey: _shellNavigatorKey,
//       pageBuilder: (BuildContext context, GoRouterState state) =>
//           const NoTransitionPage(child: ServicesPage()),
//       routes: <RouteBase>[
//         // Displayed on the root Navigator by specifying the
//         // [parentNavigatorKey].
//         GoRoute(
//           path: 'services/:id',
//           name: 'services',
//           parentNavigatorKey: rootNavigatorKey,
//           pageBuilder: (context, state) {
//             // use state.params to get router parameter values
//             final String id = state.params['id'] as String;
//             return NoTransitionPage(child: ServiceDetails(id: id));
//           },
//         ),
//       ],
//     ),
//     GoRoute(
//         path: '/wallet',
//         parentNavigatorKey: _shellNavigatorKey,
//         pageBuilder: (BuildContext context, GoRouterState state) =>
//             const NoTransitionPage(child: WalletPage())
//         // routes: <RouteBase>[
//         //   // Displayed on the root Navigator by specifying the
//         //   // [parentNavigatorKey].
//         //   GoRoute(
//         //     path: 'details',
//         //     builder: (BuildContext context, GoRouterState state) {
//         //       return const DetailsScreen(label: 'B');
//         //     },
//         //   ),
//         // ],
//         ),
//   ],
// );
