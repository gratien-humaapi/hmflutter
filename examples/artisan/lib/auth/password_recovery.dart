import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/snackbar.dart';
import '../common/widgets/submit_button.dart';
import '../core/sdk/hm_auth_sdk.dart';
import '../core/useservice.dart';
import 'auth_service.dart';
import 'auth_layout.dart';

class PasswordRecovery extends HookWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldsGroupMeta = [
      FieldGroup(
        groupName: '',
        padding: const EdgeInsets.symmetric(horizontal: 5),
        fieldsMeta: [
          FieldMeta<TextFieldProps>(
            fieldKey: "username",
            options: [Validators.required, Validators.email],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Email",
              textFieldType: HMTextFieldType.text,
              keyboardType: TextInputType.emailAddress,
              onTap: () => print("email"),
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
      hasBackButton: true,
      header: Column(
        children: [
          Text(
            "Réinitaliser le mot de passe",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: titleTextColor,
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                height: 1.15),
          ),
          // 5.py,
          Text(
            "L'e-mail de vérification sera envoyé à la boîte aux lettres. Veuillez vérifier.",
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
      submitButton: SubmitButton(
        text: "Envoyer-moi le code",
        onPress: () {
          //
          handleSubmit(
            (data) async {
              try {
                final path = await authService.forgotPassword(data);
                context.push("/auth/$path");
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    behavior: SnackBarBehavior.floating,
                    content:
                        ErrorMessage(message: (e as HMAuthSDKError).message),
                  ),
                );
              }
            },
          );
          //  VerificationCodeRoute().push(context);
        },
      ),
    );
  }
}
