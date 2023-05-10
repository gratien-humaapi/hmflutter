import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

// import 'common/constant.dart';
import 'gen/assets.gen.dart';

class AppTheming {
  static const primaryColor = Color(0xFFFFAA6C);
  static const subtitleColor = Color(0xFF707070);
  static const titleTextColor = Color(0xFF373737);
  static const labelTextColor = Color(0xFF969696);
  static final overlayColor = const Color(0xFFE0E0E0).withOpacity(0.3);
  static const fillColor = Color(0xFFF3F3F3);
  static const chipsColor = Color(0xFF585858);
  static const iconColor = Color(0xFF787878);

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    splashColor: Colors.transparent,
    highlightColor: fillColor, //Colors.transparent,
    fontFamily: 'Ubuntu',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.white)
        .copyWith(error: const Color(0xFFFF0000)),
    extensions: [
      HMButtonTheme(
        fillColor: primaryColor,
        radius: HMRadius.xl,
      ),
      HMCheckBoxTheme(
        color: primaryColor,
        checkIconColor: Colors.white,
        radius: HMRadius.md,
      ),
      HMAutocompleteTheme(
        radius: HMRadius.lg,
        overlayColor: overlayColor,
        fillColor: fillColor,
      ),
      HMMultiSelectTheme(
        radius: HMRadius.lg,
        fillColor: fillColor,
        inputIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset(Assets.icons.arrowDown),
        ),
        overlayColor: const Color(0xFFE0E0E0).withOpacity(0.3),
      ),
      HMSelectTheme(
        radius: HMRadius.lg,
        overlayColor: const Color(0xFFE0E0E0).withOpacity(0.3),
        inputIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset(Assets.icons.arrowDown),
        ),
      ),
      HMTextFieldTheme(
          fillColor: fillColor,
          radius: HMRadius.lg,
          variant: HMTextVariant.filled,
          disabledColor: const Color(0xFFFBFBFB),
          disabledTextColor: const Color(0xffbfbfbf),
          hidePasswordIcon: SvgPicture.asset(Assets.icons.hide),
          showPasswordIcon: SvgPicture.asset(Assets.icons.show)),
    ],
  );
}
