// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appshell_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRoute,
    ];

RouteBase get $appShellRoute => ShellRouteData.$route(
      factory: $AppShellRouteExtension._fromState,
      navigatorKey: AppShellRoute.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $HomePageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'notifications',
              factory: $NotificationPageRouteExtension._fromState,
              parentNavigatorKey: NotificationPageRoute.$parentNavigatorKey,
            ),
            GoRouteData.$route(
              path: 'profile',
              factory: $ProfilePageRouteExtension._fromState,
              parentNavigatorKey: ProfilePageRoute.$parentNavigatorKey,
              routes: [
                GoRouteData.$route(
                  path: 'subscription',
                  factory: $SubscriptionPageRouteExtension._fromState,
                  parentNavigatorKey: SubscriptionPageRoute.$parentNavigatorKey,
                ),
                GoRouteData.$route(
                  path: 'portfolio',
                  factory: $PorfolioPageRouteExtension._fromState,
                  parentNavigatorKey: PorfolioPageRoute.$parentNavigatorKey,
                ),
                GoRouteData.$route(
                  path: 'settings',
                  factory: $SettingsPageRouteExtension._fromState,
                  parentNavigatorKey: SettingsPageRoute.$parentNavigatorKey,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/messages',
          factory: $MessagesPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              factory: $MessagePageRouteExtension._fromState,
              parentNavigatorKey: MessagePageRoute.$parentNavigatorKey,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/services',
          factory: $ServicesPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'create-service',
              factory: $CreateServiceRouteExtension._fromState,
              parentNavigatorKey: CreateServiceRoute.$parentNavigatorKey,
            ),
            GoRouteData.$route(
              path: ':id',
              factory: $UpdateServiceRouteExtension._fromState,
              parentNavigatorKey: UpdateServiceRoute.$parentNavigatorKey,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/wallet',
          factory: $WalletPageRouteExtension._fromState,
        ),
      ],
    );

extension $AppShellRouteExtension on AppShellRoute {
  static AppShellRoute _fromState(GoRouterState state) => const AppShellRoute();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $NotificationPageRouteExtension on NotificationPageRoute {
  static NotificationPageRoute _fromState(GoRouterState state) =>
      NotificationPageRoute();

  String get location => GoRouteData.$location(
        '/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ProfilePageRouteExtension on ProfilePageRoute {
  static ProfilePageRoute _fromState(GoRouterState state) => ProfilePageRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SubscriptionPageRouteExtension on SubscriptionPageRoute {
  static SubscriptionPageRoute _fromState(GoRouterState state) =>
      SubscriptionPageRoute();

  String get location => GoRouteData.$location(
        '/profile/subscription',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $PorfolioPageRouteExtension on PorfolioPageRoute {
  static PorfolioPageRoute _fromState(GoRouterState state) =>
      PorfolioPageRoute();

  String get location => GoRouteData.$location(
        '/profile/portfolio',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SettingsPageRouteExtension on SettingsPageRoute {
  static SettingsPageRoute _fromState(GoRouterState state) =>
      SettingsPageRoute();

  String get location => GoRouteData.$location(
        '/profile/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MessagesPageRouteExtension on MessagesPageRoute {
  static MessagesPageRoute _fromState(GoRouterState state) =>
      MessagesPageRoute();

  String get location => GoRouteData.$location(
        '/messages',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MessagePageRouteExtension on MessagePageRoute {
  static MessagePageRoute _fromState(GoRouterState state) => MessagePageRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/messages/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ServicesPageRouteExtension on ServicesPageRoute {
  static ServicesPageRoute _fromState(GoRouterState state) =>
      ServicesPageRoute();

  String get location => GoRouteData.$location(
        '/services',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $CreateServiceRouteExtension on CreateServiceRoute {
  static CreateServiceRoute _fromState(GoRouterState state) =>
      CreateServiceRoute(
        hasBackButton: _$convertMapValue(
                'has-back-button', state.queryParams, _$boolConverter) ??
            true,
      );

  String get location => GoRouteData.$location(
        '/services/create-service',
        queryParams: {
          if (hasBackButton != true)
            'has-back-button': hasBackButton.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UpdateServiceRouteExtension on UpdateServiceRoute {
  static UpdateServiceRoute _fromState(GoRouterState state) =>
      UpdateServiceRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/services/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $WalletPageRouteExtension on WalletPageRoute {
  static WalletPageRoute _fromState(GoRouterState state) => WalletPageRoute();

  String get location => GoRouteData.$location(
        '/wallet',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}
