import 'package:artisan/appshell/appshell_routes.dart';
import 'package:artisan/common/constant.dart';
import '../gen/assets.gen.dart';
import 'package:artisan/homepage/homepage.routing.dart';
import 'package:artisan/message/message.routing.dart';
import 'package:artisan/services/service.routing.dart';
import 'package:artisan/wallet/wallet.routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/background.dart';
import 'bottom_bar_items.dart';

class AppShell extends HookWidget {
  const AppShell({Key? key, required this.child}) : super(key: key);

  final Widget child;
  // void changePage(ValueNotifier<int> currentPage, int newPage) {
  //   currentPage.value = newPage;
  // }

  @override
  Widget build(BuildContext context) {
    final List<HMBottomBarItems> bottomBarItems = [
      HMBottomBarItems(
          iconPath: Assets.icons.home,
          onTap: () => const HomePageRoute().go(context)),
      HMBottomBarItems(
          iconPath: Assets.icons.contact,
          onTap: () => MessagesPageRoute().go(context)),
      HMBottomBarItems(
          iconPath: Assets.icons.service,
          onTap: () => ServicesPageRoute().go(context)),
      HMBottomBarItems(
          iconPath: Assets.icons.wallet,
          onTap: () => WalletPageRoute().go(context)),
    ];
    // final pageController = usePageController(initialPage: 0);
    final currentPage = useState(0);
    // final isMounted = useIsMounted();

    // pageController.addListener(() {
    //   final int value = pageController.page!.round();
    //   if (value != currentPage.value && isMounted()) {
    //     changePage(currentPage, value);
    //   }
    // });

    // useAutomaticKeepAlive(wantKeepAlive: true);

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              // backgroundColor: Colors.green.shade100,
              title: const Text('Do you want to go back?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Background(
        child: HMLayout(
          principalButton: HMIconButton(
              icon: const Icon(
                Icons.add_rounded,
              ),
              iconColor: Colors.white,
              radius: HMRadius.xl,
              size: HMIconButtonSize.lg,
              fillColor: primaryColor,
              onPressed: () {
                CreateServiceRoute().push(context);
              }),
          radius: BorderRadius.circular(20),
          currentindex: currentPage.value,
          selectedItemColor: primaryColor,
          tabItems: List.generate(
            bottomBarItems.length,
            (index) => SizedBox(
              height: 25,
              width: 25,
              child: SvgPicture.asset(
                bottomBarItems[index].iconPath,
                color: index == currentPage.value
                    ? primaryColor
                    : const Color(0xFFCCCCCC),
              ),
            ),
          ),
          onTap: (int index) {
            currentPage.value = index;
            bottomBarItems[index].onTap();
          },
          child: child,
        ),
      ),
    );
  }
}
