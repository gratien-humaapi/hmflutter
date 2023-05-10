import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'statistic_bloc.dart';
import 'statistic_card.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Statistics',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w500,
                    color: subtitleColor),
              ),
              // HMButton(
              //     content: 'see all',
              //     size: HMButtonSize.sm,
              //     buttonVariant: HMButtonVariant.transparent,
              //     textColor: labelTextColor,
              //     onPressed: () {
              //       // Modular.to.pushNamed('/stats');
              //     }),
            ],
          ),
        ),
        StatisticBloc(
          items: [
            StatisticCard(
              margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
              nbrproject: 0,
              icon: SvgPicture.asset(Assets.icons.project),
              color: const Color(0xff70D4FF),
              title: 'Projects',
            ),
            StatisticCard(
              margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
              nbrproject: 0,
              icon: SvgPicture.asset(Assets.icons.task),
              color: const Color(0xffFFAA6C),
              title: 'Tasks',
            ),
            StatisticCard(
              nbrproject: 0,
              icon: SvgPicture.asset(Assets.icons.credit),
              color: const Color(0xff5D8EED),
              title: 'Credits',
            ),
          ],
        )
      ],
    );
  }
}
