import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.radius,
    required this.hintText,
  }) : super(key: key);
  final HMRadius? radius;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB9B9B9).withOpacity(0.16),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: HMTextField(
        fillColor: Colors.white,
        radius: radius,
        size: HMTextFieldSize.md,
        prefixIcon: SizedBox(
          child: SvgPicture.asset(
            Assets.icons.search,
            // height: 14,
            // width: 14,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
