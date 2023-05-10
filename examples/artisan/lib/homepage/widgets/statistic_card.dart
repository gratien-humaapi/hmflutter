import 'package:artisan/common/size_config.dart';
import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    required this.nbrproject,
    this.margin,
    required this.icon,
    required this.color,
    required this.title,
    Key? key,
  }) : super(key: key);
  final int nbrproject;
  final EdgeInsets? margin;
  final Widget icon;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(12)),
      // height: getProportionateScreenHeight(62),
      width: getProportionateScreenWidth(155),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$nbrproject',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
