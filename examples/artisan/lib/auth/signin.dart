import 'package:artisan/auth/auth.routing.dart';
import 'package:artisan/auth/auth_layout.dart';
import 'package:artisan/auth/auth_service.dart';
import 'package:artisan/auth/store/user_store.dart';
import 'package:artisan/auth/widgets/account_check.dart';
import 'package:artisan/auth/widgets/logo.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/fakedata/users.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/snackbar.dart';
import '../common/widgets/submit_button.dart';
import '../core/sdk/hm_auth_sdk.dart';

final _defaultValue = {
  "username": "gratien.adn@gmail.com",
  "password": "Paul2023.."
};

class SignIn extends HookWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldsGroupMeta = [
      FieldGroup(
        groupName: '',
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
        ],
      ),
    ];
    // final form = useForm(fieldGroups: fieldsGroupMeta);
    final form = useForm(
        fieldGroups: fieldsGroupMeta,
        defaultValue: _defaultValue,
        onChangeValidation: false);
    final handleSubmit = form.handleSubmit;
    final AuthService authService = useService<AuthService>();
    final UserStore userStore = useService<UserStore>();
    SizeConfig().init(context);

    return AuthLayout(
      header: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Logo(),
          getProportionateScreenHeight(69).py,
          const Text(
            "Content de vous voir",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Connectez-vous à votre compte",
            style: TextStyle(fontSize: 14, color: labelTextColor),
          ),
        ],
      ),
      inputFields: HMReactiveForm(
        form: form,
        fieldMeta: fieldsGroupMeta,
        decoratedWidget: (child) => child,
      ),
      trailing: GestureDetector(
        onTap: () => PasswordRecoveryRoute().push(context),
        child: const Text(
          "Mot de passe oublié?",
          style: TextStyle(color: Color(0xFF6D6D6D), fontSize: 14),
        ),
      ),
      submitButton: SubmitButton(
        text: "S’identifier",
        onPress: () {
          //
          handleSubmit(
            (data) async {
              try {
                final path = await authService.signIn(data);
                print(path);
                userStore.saveUser(usersList.firstWhere((element) =>
                    element.contact.email == 'gratien.adn@gmail.com'));
                GoRouter.of(context).go(path);
              } on HMAuthSDKError catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    behavior: SnackBarBehavior.floating,
                    content: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      child: ErrorMessage(message: e.message),
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
      footer: HaveAccountCheck(
        firstText: "Vous n’avez pas de compte?  ",
        secondText: "S'inscrire",
        onTap: () => SignUpRoute().go(context),
      ),
    );
  }
}
