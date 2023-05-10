import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        leading: HMIconButton(
          icon: SvgPicture.asset(Assets.icons.arrowLeft),
          radius: HMRadius.xl,
          fillColor: fillColor,
          buttonVariant: HMButtonVariant.transparent,
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
            color: titleTextColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(24),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Aucune notification",
                style: TextStyle(
                    color: titleTextColor,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Vos notifications apparaîtront ici",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: labelTextColor,
                    fontSize: getProportionateScreenWidth(14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
