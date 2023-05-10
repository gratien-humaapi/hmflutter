import 'package:artisan/appshell/appshell_routes.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/homepage/homepage.routing.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/size_config.dart';
import '../common/widgets/submit_button.dart';
import '../services/service.routing.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: //constraints,
              BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(29)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  SvgPicture.asset(Assets.icons.logo),
                  getProportionateScreenHeight(44).py,
                  Text(
                    "Bonjour, Bienvenue",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                        color: titleTextColor),
                  ),
                  Text(
                    "Vivez dans l’espace des meilleurs projets avec des clients potentiels.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: labelTextColor,
                        fontSize: getProportionateScreenWidth(12)),
                  ),
                  getProportionateScreenHeight(75).py,
                  SubmitButton(
                    text: "Créer un service pour continuer",
                    onPress: () {
                      CreateServiceRoute(hasBackButton: false).go(context);
                    },
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(30)),
                    child: HMButton(
                        content: "Ignorer",
                        fontWeight: FontWeight.w500,
                        textColor: const Color(0xFF6D6D6D),
                        buttonVariant: HMButtonVariant.transparent,
                        onPressed: () {
                          const HomePageRoute().go(context);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
