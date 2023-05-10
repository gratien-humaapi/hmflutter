import 'dart:ui';

import 'package:artisan/homepage/widgets/statistic_bloc.dart';
import 'package:artisan/homepage/widgets/statistic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class StatisticScreen extends HookWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  void changePage(ValueNotifier<int> currentPage, int newPage) {
    currentPage.value = newPage;
  }

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);
    final currentPage = useState(0);
    final isMounted = useIsMounted();

    pageController.addListener(() {
      final int value = pageController.page!.round();
      if (value != currentPage.value && isMounted()) {
        changePage(currentPage, value);
      }
    });

    final clientList = useState([]);

    // useAutomaticKeepAlive(wantKeepAlive: true);

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: const [
                0,
                0.2,
              ],
              colors: [
                // Color(0xFF49A9F8),
                Colors.blue.shade100,
                Colors.white,
              ]),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 255, sigmaY: 255),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 14, bottom: 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HMIconButton(
                                  icon:
                                      const Icon(Icons.arrow_back_ios_rounded),
                                  iconColor: const Color(0xff7D7D7D),
                                  radius: HMRadius.lg,
                                  size: HMIconButtonSize.sm,
                                  fillColor: const Color(0xB1FFFFFF),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              const SizedBox(width: 14),
                              Text(
                                'Statistics',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade800),
                              )
                            ],
                          ),
                        ),
                        const StatisticBloc(
                          items: [
                            StatisticCard(
                              margin: EdgeInsets.only(right: 15),
                              nbrproject: 20,
                              icon: Icon(Icons.text_snippet),
                              color: Color(0xff70D4FF),
                              title: 'Total project',
                            ),
                            StatisticCard(
                              margin: EdgeInsets.only(right: 15),
                              nbrproject: 120,
                              icon: Icon(Icons.text_snippet),
                              color: Color(0xffFFAA6C),
                              title: 'Total tasks',
                            ),
                            StatisticCard(
                              nbrproject: 20,
                              icon: Icon(Icons.text_snippet),
                              color: Color(0xff5D8EED),
                              title: 'Total credits',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 14,
                                spreadRadius: 2,
                                color: const Color(0xffA0A0A0).withOpacity(0.2),
                              ),
                            ]),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Activity',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5),
                                    Text('All trafic from your projets'),
                                  ],
                                ),
                                Icon(Icons.more_horiz_rounded,
                                    color: Color(0xff7D7D7D), size: 30),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                // child: Container(color: Colors.pink),
                              ),
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Statuts(
                                  statut: 'In progress',
                                  dotColor: Color(0xffFFAA6C),
                                ),
                                SizedBox(width: 16),
                                Statuts(
                                    statut: 'Completed',
                                    dotColor: Color(0xff3BE442)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 14,
                                spreadRadius: 2,
                                color: const Color(0xffA0A0A0).withOpacity(0.2),
                              ),
                            ]),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Services providers',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                        'Total trafic from your services provider'),
                                  ],
                                ),
                                Icon(Icons.open_in_full_rounded,
                                    color: Color(0xff7D7D7D), size: 30),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                // child: Container(color: Colors.pink),
                              ),
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Statuts(
                                  statut: 'Estimated budget',
                                  dotColor: Color(0xff43ADFF),
                                ),
                                SizedBox(width: 16),
                                Statuts(
                                    statut: 'Actual budget spent',
                                    dotColor: Color(0xffFB649C)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 14,
                                spreadRadius: 2,
                                color: const Color(0xffA0A0A0).withOpacity(0.2),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Budget',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Total trafic from your budget'),
                                  ],
                                ),
                                Chip(
                                  backgroundColor:
                                      const Color(0xffFFAA6C).withOpacity(0.1),
                                  label: const Text(
                                    'Weekly',
                                    style: TextStyle(color: Color(0xffFFAA6C)),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                // child: Container(color: Colors.pink),
                              ),
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Statuts(
                                  statut: 'Estimated budget',
                                  dotColor: Color(0xff43ADFF),
                                ),
                                SizedBox(width: 16),
                                Statuts(
                                    statut: 'Actual budget spent',
                                    dotColor: Color(0xffFB649C)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 14,
                                spreadRadius: 2,
                                color: const Color(0xffA0A0A0).withOpacity(0.2),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total balance',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Total trafic from your budget'),
                                  ],
                                ),
                                Chip(
                                  backgroundColor:
                                      const Color(0xffFFAA6C).withOpacity(0.1),
                                  label: const Text(
                                    'Weekly',
                                    style: TextStyle(color: Color(0xffFFAA6C)),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 200,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // CircularProgressIndicator(
                                        //   strokeWidth: 10,
                                        //   value: 0.2,
                                        //   color: Colors.green,
                                        //   // backgroundColor: Colors.blue,
                                        // ),
                                        Container(
                                          height: 120,
                                          width: 120,
                                          decoration: const CustomTabIndicator(
                                            color: Color(0xff00E391),
                                            lineWidth: 10,
                                          ),
                                          child: const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Your balance',
                                                style: TextStyle(
                                                    color: Color(0xff5A5A5A)),
                                              ),
                                              Text(
                                                r'$54 000',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff5A5A5A)),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Statuts(
                                              statut: 'Total service',
                                              dotColor: Color(0xff00E391),
                                            ),
                                            SizedBox(width: 16),
                                            Statuts(
                                                statut: 'Total online shop',
                                                dotColor: Color(0xffFB649C)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomTabIndicator extends Decoration {
  const CustomTabIndicator({
    this.radius = 8,
    this.lineWidth = 5,
    this.color = Colors.blue,
  });
  final double radius;

  final Color color;

  final double lineWidth;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(
      color: color,
      radius: radius,
      lineWidth: lineWidth,
    );
  }
}

class _DotPainter extends BoxPainter {
  _DotPainter({
    required this.color,
    required this.radius,
    required this.lineWidth,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..color = color
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.fill,
        super(onChange);
  final Paint _paint;
  final Color color;
  final double radius;
  final double lineWidth;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    // Background
    canvas.drawArc(
        rect,
        -4,
        4,
        false,
        _paint
          ..strokeWidth = lineWidth
          ..color = const Color(0xffF6F6F6)
          ..style = PaintingStyle.stroke);
    //  First
    canvas.drawArc(
        rect,
        0.8,
        -2.4,
        false,
        _paint
          ..strokeWidth = lineWidth
          ..color = const Color(0xffFF6C6C)
          ..style = PaintingStyle.stroke);

    // Second
    canvas.drawArc(
        rect,
        0.8,
        -1.8,
        // math.pi,
        false,
        _paint
          ..strokeWidth = lineWidth
          ..color = color
          ..style = PaintingStyle.stroke);
  }
}

class Statuts extends StatelessWidget {
  const Statuts({
    required this.statut,
    Key? key,
    required this.dotColor,
  }) : super(key: key);
  final String statut;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: dotColor,
          radius: 5,
        ),
        const SizedBox(width: 5),
        Text(statut),
      ],
    );
  }
}
