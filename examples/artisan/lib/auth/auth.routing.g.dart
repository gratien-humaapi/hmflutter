// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.routing.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $authRoute,
    ];

RouteBase get $authRoute => GoRouteData.$route(
      path: '/auth',
      factory: $AuthRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'sign-up',
          factory: $SignUpRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'confirm-sign-up',
          factory: $SignUpConfirmationRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'password-recovery',
          factory: $PasswordRecoveryRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'verification-code',
          factory: $VerificationCodeRouteExtension._fromState,
        ),
      ],
    );

extension $AuthRouteExtension on AuthRoute {
  static AuthRoute _fromState(GoRouterState state) => AuthRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => SignUpRoute();

  String get location => GoRouteData.$location(
        '/auth/sign-up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SignUpConfirmationRouteExtension on SignUpConfirmationRoute {
  static SignUpConfirmationRoute _fromState(GoRouterState state) =>
      SignUpConfirmationRoute();

  String get location => GoRouteData.$location(
        '/auth/confirm-sign-up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $PasswordRecoveryRouteExtension on PasswordRecoveryRoute {
  static PasswordRecoveryRoute _fromState(GoRouterState state) =>
      PasswordRecoveryRoute();

  String get location => GoRouteData.$location(
        '/auth/password-recovery',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $VerificationCodeRouteExtension on VerificationCodeRoute {
  static VerificationCodeRoute _fromState(GoRouterState state) =>
      VerificationCodeRoute();

  String get location => GoRouteData.$location(
        '/auth/verification-code',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
