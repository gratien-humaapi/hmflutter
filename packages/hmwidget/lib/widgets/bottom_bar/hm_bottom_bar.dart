import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'scrollcontroller_provider.dart';

class HMBottomNavBar extends HookWidget {
  HMBottomNavBar({
    this.principalButtonSize,
    required this.tabItems,
    required this.child,
    required this.onTap,
    this.currentPage = 0,
    this.bottomBarColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
    this.width,
    this.height,
    this.radius,
    this.boxShadow,
    this.alignment,
    this.onBottomBarShown,
    this.principalButton,
    int? principalButtonIndex,
    this.onBottomBarHidden,
    super.key,
  }) {
    _principalButtonIndex = principalButtonIndex ?? tabItems.length ~/ 2;
  }
  // final ScrollController scrollController;
  final int currentPage;
  final Color? bottomBarColor;
  final Color? selectedItemColor;
  final Widget child;
  final Color? unselectedItemColor;
  final Duration duration;
  final void Function(int index) onTap;
  final Curve curve;
  final double? width;
  final BoxShadow? boxShadow;
  final List<Widget> tabItems;
  final double? height;
  final BorderRadius? radius;
  final Widget? principalButton;
  final Alignment? alignment;
  final Function()? onBottomBarShown;
  final Function()? onBottomBarHidden;
  final double? principalButtonSize;
  late final int _principalButtonIndex;

  // void changePage(ValueNotifier<int> currentPage, int newPage) {
  //   currentPage.value = newPage;
  // }

  @override
  Widget build(BuildContext context) {
    final scrollController = useState(ScrollController());
    final isScrollingDown = useState(false);
    final controller = useAnimationController(duration: duration);
    final offsetAnimation = useState(Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: curve,
    )));

    // useAutomaticKeepAlive();
    List<Widget> items = [];

// Add principal button in tabItems list
    items = List.from(tabItems)
      ..insert(
          _principalButtonIndex,
          Tab(
            icon: Container(),
          ));

    // Show the bottomBar
    void showBottomBar(AnimationController controller) {
      controller.forward();
      if (onBottomBarShown != null) {
        onBottomBarShown!();
      }
    }

    // Calculate the index to ignore that of the main button
    int? getIndex(int index) {
      if (index == _principalButtonIndex) {
        return null;
      }
      final newIndex = index > _principalButtonIndex ? index - 1 : index;
      return newIndex;
    }

    // Hide the bottomBar
    void hideBottomBar(AnimationController controller) {
      controller.reverse();
      if (onBottomBarHidden != null) {
        onBottomBarHidden!();
      }
    }

    // final tabController = useTabController(
    //     initialLength: items.length, initialIndex: currentPage);

    controller.forward();

    final double tabWidth = width ?? MediaQuery.of(context).size.width * 0.9;

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          // Check the direction of the scroll
          if (scrollNotification.scrollDelta! < 0 &&
              scrollNotification.metrics.axis == Axis.vertical) {
            // User is scrolling down
            // print('scrolling down...');
            isScrollingDown.value = false;
            showBottomBar(controller);
          } else if (scrollNotification.scrollDelta! > 0 &&
              scrollNotification.metrics.axis == Axis.vertical) {
            // User is scrolling up
            // print('scrolling up...');
            isScrollingDown.value = true;
            hideBottomBar(controller);
          }
        }
        return true;
      },
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          InheritedDataProvider(
            scrollController: scrollController.value,
            child: child,
          ),
          // Positioned(
          //     bottom: start,
          //     child: AnimatedContainer(
          //       duration: const Duration(milliseconds: 300),
          //       curve: Curves.easeIn,
          //       width: isOnTop.value == true ? 0 : 40,
          //       height: isOnTop.value == true ? 0 : 40,
          //       decoration: BoxDecoration(
          //         color: bottomBarColor,
          //         shape: BoxShape.circle,
          //       ),
          //       padding: EdgeInsets.zero,
          //       margin: EdgeInsets.zero,
          //       child: ClipOval(
          //         child: Material(
          //           color: Colors.transparent,
          //           child: SizedBox(
          //             height: 40,
          //             width: 40,
          //             child: Center(
          //               child: IconButton(
          //                 padding: EdgeInsets.zero,
          //                 onPressed: () {
          //                   isOnTop.value = true;
          //                   isScrollingDown.value = false;
          //                   showBottomBar(controller);
          //                 },
          //                 icon: Icon(
          //                   Icons.arrow_upward_rounded,
          //                   color: unselectedItemColor,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     )),
          Align(
            alignment: alignment ?? const Alignment(0, 0.95),
            child: SlideTransition(
              position: offsetAnimation.value,
              child: Container(
                width: tabWidth,
                height: height ?? 59,
                decoration: BoxDecoration(
                  color: bottomBarColor ?? Colors.white,
                  borderRadius: radius ?? BorderRadius.circular(50),
                  boxShadow: [
                    boxShadow ??
                        BoxShadow(
                          color: const Color(0xffA0A0A0).withOpacity(0.5),
                          offset: const Offset(0, 3),
                          blurRadius: 18,
                        ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < items.length; i++) ...[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  final newIndex = getIndex(i);
                                  if (newIndex == null) {
                                    return;
                                  }

                                  onTap(newIndex);
                                },
                                child: Container(
                                  color: Colors.white.withOpacity(0.005),
                                  child: items[i],
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                      Center(
                        widthFactor: 1.0,
                        child: principalButton,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
