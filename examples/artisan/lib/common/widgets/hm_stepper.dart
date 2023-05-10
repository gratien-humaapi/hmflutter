import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class HMStepper extends HookWidget {
  const HMStepper({
    super.key,
    required this.steps,
    required this.onStepContinue,
    required this.currentStep,
    required this.endText,
    required this.controller,
    this.padding,
    required this.onStepChange,
    required this.onStepCancel,
  });

  final List<HMStep> steps;
  final String endText;
  final int currentStep;
  final EdgeInsets? padding;
  final VoidCallback? onStepCancel;
  final ValueChanged<int>? onStepChange;
  final PageController controller;
  final VoidCallback? onStepContinue;

  @override
  Widget build(BuildContext context) {
    // final currentPage = useState(0.0);
    // controller.addListener(() {
    //   currentPage.value = controller.page ?? 0;
    //   onStepChange?.call(currentPage.value.toInt());
    // });
    isKeyboardOpened() {
      if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
        // Keyboard is visible.
        return false;
      } else {
        // Keyboard is not visible.
        return true;
      }
    }

    return Column(
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 5.0,
              child: Row(
                children: List.generate(
                  steps.length,
                  (index) => Expanded(
                    child: Container(
                      color: currentStep >= index
                          ? primaryColor
                          : Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              onStepChange?.call(value);
            },
            children: List.generate(
              steps.length,
              (index) => Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        // Use SliverFillRemaining widget to fill all available space
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: padding ??
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                steps[currentStep],
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Control button
                  Visibility(
                    visible: isKeyboardOpened(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (currentStep > 0)
                            Expanded(
                              child: HMButton(
                                  content: "Précédent",
                                  disabled: onStepCancel == null,
                                  radius: HMRadius.xl,
                                  borderColor: const Color(0xFFF3F3F3),
                                  textColor: primaryColor, // Colors.white,
                                  buttonVariant: HMButtonVariant.outlined,
                                  fontWeight: FontWeight.w500,
                                  size: HMButtonSize.lg,
                                  onPressed: () {
                                    onStepCancel?.call();
                                  }),
                            ),
                          10.px,
                          Expanded(
                            child: HMButton(
                                content: currentStep == steps.length - 1
                                    ? endText
                                    : "Suivant",
                                fontWeight: FontWeight.w500,
                                size: HMButtonSize.lg,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0.0, 1.0),
                                    color: primaryColor.withOpacity(0.6),
                                    spreadRadius: 0,
                                    blurRadius: 18,
                                  ),
                                ],
                                disabled: onStepContinue == null,
                                radius: HMRadius.xl,
                                textColor: Colors.white,
                                onPressed: () {
                                  onStepContinue?.call();
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// HMStep

class HMStep extends HookWidget {
  const HMStep({
    super.key,
    required this.title,
    required this.subtitle,
    required this.inputFields,
    this.infoText,
  });
  final Widget title;
  final Widget subtitle;
  final Widget inputFields;
  final Widget? infoText;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        getProportionateScreenHeight(8).py,
        subtitle,
        getProportionateScreenHeight(23).py,
        inputFields,
        getProportionateScreenHeight(29).py,
        if (infoText != null) infoText!,
      ],
    );
  }
}
