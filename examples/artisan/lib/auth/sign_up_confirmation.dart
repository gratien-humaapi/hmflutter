import 'package:artisan/auth/auth_layout.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/snackbar.dart';
import '../common/widgets/submit_button.dart';
import '../core/sdk/hm_auth_sdk.dart';
import '../core/useservice.dart';
import 'auth_service.dart';

class SignUpConfirmationPage extends HookWidget {
  const SignUpConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldsGroupMeta = [
      FieldGroup(
        groupName: '',
        padding: const EdgeInsets.symmetric(horizontal: 5),
        fieldsMeta: [
          FieldMeta<TextFieldProps>(
            fieldKey: "confirmationCode",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Entrer le code",
              textFieldType: HMTextFieldType.text,
              keyboardType: TextInputType.text,
              onTap: () => print("confirmationCode"),
              onChange: (String val) {
                // print(val);
              },
            ),
          ),
        ],
      ),
    ];
    final form =
        useForm(fieldGroups: fieldsGroupMeta, onChangeValidation: false);
    final handleSubmit = form.handleSubmit;
    final AuthService authService = useService<AuthService>();

    SizeConfig().init(context);
    return AuthLayout(
      header: Column(
        children: [
          Text(
            "Vérification",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: titleTextColor,
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                height: 1.15),
          ),
          // 5.py,
          Text(
            "Un code vous a été envoyer sur votre email.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: labelTextColor),
          ),
        ],
      ),
      inputFields: HMReactiveForm(
        form: form,
        fieldMeta: fieldsGroupMeta,
        decoratedWidget: (child) => child,
      ),
      trailing: RichText(
        text: TextSpan(
          text: "J’ai pas reçu de code! ",
          style: TextStyle(
              color: labelTextColor, fontSize: getProportionateScreenWidth(14)),
          children: [
            TextSpan(
              text: "Renvoyer",
              style: const TextStyle(color: primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  try {
                    final bool res = await authService.resendConfirmationCode();
                    if (res) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          elevation: 0.0,
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          // Ajouter un animation pour l'email
                          content: SuccessMessage(message: "Email envoyé"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          elevation: 0.0,
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          // Ajouter un animation pour l'email
                          content: ErrorMessage(message: "Email not found"),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        // Ajouter un animation pour l'email
                        content: ErrorMessage(
                            message: (e as HMAuthSDKError).message),
                      ),
                    );
                  }
                },
            ),
          ],
        ),
      ),
      submitButton: SubmitButton(
        text: "Vérifier",
        onPress: () {
          handleSubmit((data) async {
            // await Future.delayed(const Duration(seconds: 5)).then(
            //   (value) => print('yes submit'),
            // );
            try {
              final path = await authService.confirmSignUp(data);
              print(" uhsdj $path");
              GoRouter.of(context).go(path);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  behavior: SnackBarBehavior.floating,
                  content: ErrorMessage(message: (e as HMAuthSDKError).message),
                ),
              );
            }
          });

          //
          // MoreInfoRoute().pushReplacement(context);
        },
      ),
    );
  }
}
