import 'package:artisan/auth/new_password.dart';
import 'package:artisan/auth/password_recovery.dart';
import 'package:artisan/auth/sign_up_confirmation.dart';
import 'package:artisan/auth/signin.dart';
import 'package:artisan/auth/signup.dart';
import 'package:artisan/auth/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'auth.routing.g.dart';

@TypedGoRoute<AuthRoute>(path: '/auth', routes: [
  TypedGoRoute<SignUpRoute>(
    path: 'sign-up',
  ),
  TypedGoRoute<SignUpConfirmationRoute>(
    path: 'confirm-sign-up',
  ),
  TypedGoRoute<PasswordRecoveryRoute>(
    path: 'password-recovery',
  ),
  TypedGoRoute<VerificationCodeRoute>(
    path: 'verification-code',
  ),
  // TypedGoRoute<VerificationCodeRoute>(
  //   path: 'verification-code',
  // ),
])
@immutable
class AuthRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SignIn());
  }
}

@immutable
class SignUpConfirmationRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SignUpConfirmationPage());
  }
}

@immutable
class SignUpRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SignUp());
  }
}

@immutable
class NewPasswordRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: NewPassword());
  }
}

@immutable
class PasswordRecoveryRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: PasswordRecovery());
  }
}

@immutable
class VerificationCodeRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: VerificationCode());
  }
}
