// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_info.routing.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $moreInfoRoute,
    ];

RouteBase get $moreInfoRoute => GoRouteData.$route(
      path: '/more-info',
      factory: $MoreInfoRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'welcome',
          factory: $WelcomeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'profile-image',
          factory: $AddProfileImageRouteExtension._fromState,
        ),
      ],
    );

extension $MoreInfoRouteExtension on MoreInfoRoute {
  static MoreInfoRoute _fromState(GoRouterState state) => MoreInfoRoute();

  String get location => GoRouteData.$location(
        '/more-info',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $WelcomeRouteExtension on WelcomeRoute {
  static WelcomeRoute _fromState(GoRouterState state) => WelcomeRoute();

  String get location => GoRouteData.$location(
        '/more-info/welcome',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AddProfileImageRouteExtension on AddProfileImageRoute {
  static AddProfileImageRoute _fromState(GoRouterState state) =>
      AddProfileImageRoute();

  String get location => GoRouteData.$location(
        '/more-info/profile-image',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
