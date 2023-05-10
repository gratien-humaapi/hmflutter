import 'package:artisan/auth/auth.routing.dart';
import 'package:artisan/auth/auth_layout.dart';
import 'package:artisan/auth/auth_service.dart';
import 'package:artisan/auth/widgets/account_check.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/size_config.dart';
import '../common/widgets/snackbar.dart';
import '../common/widgets/submit_button.dart';
import '../core/sdk/hm_auth_sdk.dart';
import 'widgets/logo.dart';

final _defaultValue = {
  "username": "gratien.adn@gmail.com",
  "password": "Paul2023..",
  "confirmPassword": "Paul2023.."
};

class SignUp extends HookWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldsGroupMeta = [
      FieldGroup(
        groupName: '',
        validators: [Validators.mustMatch("password", "confirmPassword")],
        fieldsMeta: [
          FieldMeta<TextFieldProps>(
            fieldKey: "username",
            options: [Validators.required, Validators.email],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Email ou  numéro de téléphone",
              textFieldType: HMTextFieldType.text,
              keyboardType: TextInputType.emailAddress,
              onTap: () => print("email"),
              onChange: (String val) {
                // print(val);
              },
            ),
          ),
          FieldMeta<TextFieldProps>(
            fieldKey: "password",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Mot de passe",
              textFieldType: HMTextFieldType.password,
              keyboardType: TextInputType.visiblePassword,
              onTap: () => print("password"),
              onChange: (String val) {
                // print(val);
              },
            ),
          ),
          FieldMeta<TextFieldProps>(
            fieldKey: "confirmPassword",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Confirmer le mot de passe",
              textFieldType: HMTextFieldType.password,
              keyboardType: TextInputType.visiblePassword,
              onTap: () => print("password"),
              onChange: (String val) {
                // print(val);
              },
            ),
          ),
        ],
      ),
    ];
    final form = useForm(
        fieldGroups: fieldsGroupMeta,
        defaultValue: _defaultValue,
        onChangeValidation: false);
    final handleSubmit = form.handleSubmit;
    final AuthService authService = useService<AuthService>();

    final submit = useState(false);
    return AuthLayout(
      header: Column(
        children: [
          const Logo(),
          getProportionateScreenHeight(69).py,
          const Text(
            "Créer un compte",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          // 5.py,
          const Text(
            "Inscrivez-vous pour continuer",
            style: TextStyle(fontSize: 14, color: Color(0xFF949494)),
          ),
        ],
      ),
      inputFields: HMReactiveForm(
        form: form,
        fieldMeta: fieldsGroupMeta,
        decoratedWidget: (child) => child,
      ),
      submitButton: SubmitButton(
        text: "Commencer",
        isLoading: submit.value,
        onPress: () async {
          submit.value = true;
          handleSubmit(
            (data) async {
              // await Future.delayed(const Duration(seconds: 5)).then(
              //   (value) => print('yes submit'),
              // );
              try {
                final path = await authService.signUp(data);
                print(" uhsdj $path");
                GoRouter.of(context).go("/auth/$path");
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
          submit.value = false;
        },
      ),
      footer: HaveAccountCheck(
        firstText: "Vous avez déjà un compte?  ",
        secondText: "Se connecter",
        onTap: () => AuthRoute().go(context),
      ),
    );
  }
}
