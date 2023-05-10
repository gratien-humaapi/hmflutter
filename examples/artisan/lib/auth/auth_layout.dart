import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/size_config.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.header,
    required this.inputFields,
    required this.submitButton,
    this.trailing,
    this.padding,
    this.hasBackButton = false,
    this.footer,
  });
  final Widget header;
  final Widget inputFields;
  final Widget? trailing;
  final Widget? footer;
  final Widget submitButton;
  final EdgeInsets? padding;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: hasBackButton
            ? AppBar(
                elevation: 0.0,
                forceMaterialTransparency: true,
                // backgroundColor: Colors.transparent,
                leadingWidth: 100,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.white.withOpacity(0.05),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(Assets.icons.arrowLeft),
                          8.px,
                          const Text("Retour"),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : null,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 28.0),
              child: ConstrainedBox(
                constraints: //constraints,
                    BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      header,
                      getProportionateScreenHeight(30).py,
                      inputFields,
                      if (trailing != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 13.0, left: 15),
                              child: trailing),
                        ),
                      const Spacer(),
                      submitButton,
                      if (footer != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: footer,
                        ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
