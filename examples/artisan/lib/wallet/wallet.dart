import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/constant.dart';
import '../common/size_config.dart';
import '../common/widgets/background.dart';
import '../homepage/widgets/statistics_screen.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Background(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(28)),
              alignment: Alignment.centerLeft,
              child: Text(
                "Portefeuille",
                style: TextStyle(
                    color: titleTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(24)),
              ),
            ),
            getProportionateScreenHeight(42).py,
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(28)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total balance',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Total trafic from your budget',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: const CustomTabIndicator(
                                  color: Color(0xff00E391),
                                  lineWidth: 10,
                                ),
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Your balance',
                                      style:
                                          TextStyle(color: Color(0xff5A5A5A)),
                                    ),
                                    Text(
                                      '0 FCFA',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(28)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last transactions",
                    style: TextStyle(
                        color: labelTextColor,
                        fontSize: getProportionateScreenWidth(12)),
                  ),
                  HMButton(
                      content: "see all",
                      textColor: labelTextColor,
                      size: HMButtonSize.sm,
                      buttonVariant: HMButtonVariant.transparent,
                      onPressed: () {}),
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Aucune transaction",
                  style: TextStyle(
                      color: titleTextColor,
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Vos transactions apparaîtront ici",
                  style: TextStyle(
                      color: labelTextColor,
                      fontSize: getProportionateScreenWidth(14)),
                ),
              ],
            )),
          ],
        ),
      ),
    );
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
        4.8,
        false,
        _paint
          ..strokeWidth = lineWidth
          ..color = const Color(0xffF6F6F6)
          ..style = PaintingStyle.stroke);
    //  First
    // canvas.drawArc(
    //     rect,
    //     0.8,
    //     -2.4,
    //     false,
    //     _paint
    //       ..strokeWidth = lineWidth
    //       ..color = const Color(0xffFF6C6C)
    //       ..style = PaintingStyle.stroke);

    // Second
    // canvas.drawArc(
    //     rect,
    //     0.8,
    //     -1.8,
    //     // math.pi,
    //     false,
    //     _paint
    //       ..strokeWidth = lineWidth
    //       ..color = color
    //       ..style = PaintingStyle.stroke);
  }
}
