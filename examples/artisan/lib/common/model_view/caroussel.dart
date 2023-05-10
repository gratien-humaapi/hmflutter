import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyCaroussel extends HookWidget {
  const MyCaroussel({
    Key? key,
    this.hasIndicator = true,
    this.height = 100,
    required this.carousselItems,
    this.itemsPadding,
  }) : super(key: key);
  final bool hasIndicator;
  final double height;
  final EdgeInsets? itemsPadding;
  final List<Widget> carousselItems;

  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(viewportFraction: 0.9, initialPage: 0);
    final activePage = useState(0);
    return Column(
      children: [
        SizedBox(
          height: height,
          child: PageView.builder(
            itemCount: carousselItems.length,
            padEnds: false,
            controller: pageController,
            pageSnapping: true,
            onPageChanged: (page) {
              activePage.value = page;
            },
            itemBuilder: (context, index) {
              return carousselItems[index];
            },
          ),
        ),
        const SizedBox(height: 15),
        if (hasIndicator)
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.black26,
            //   borderRadius: BorderRadius.circular(20),
            // ),
            // padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(carousselItems.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(3),
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      color: activePage.value == index
                          ? const Color(0xffffaa6c)
                          : Colors.black26,
                      shape: BoxShape.circle),
                );
              }),
            ),
          ),
      ],
    );
  }
}
