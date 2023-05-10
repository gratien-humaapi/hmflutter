import 'package:artisan/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletPageRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: WalletPage());
  }
}
