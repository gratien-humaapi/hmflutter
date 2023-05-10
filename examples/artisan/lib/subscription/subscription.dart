import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: HMIconButton(
          icon: SvgPicture.asset(Assets.icons.arrowLeft),
          radius: HMRadius.xl,
          fillColor: fillColor,
          buttonVariant: HMButtonVariant.transparent,
          onPressed: () {
            // context.go("/");
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Abonnements",
          style: TextStyle(
              color: titleTextColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(24)),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Aucun abonnements",
                style: TextStyle(
                    color: titleTextColor,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Vous n’avez pas d’abonnements",
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
