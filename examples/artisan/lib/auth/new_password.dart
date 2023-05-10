import 'package:artisan/auth/auth.routing.dart';
import 'package:artisan/auth/auth_layout.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/submit_button.dart';

class NewPassword extends HookWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldsGroupMeta = [
      FieldGroup(
        groupName: '',
        padding: const EdgeInsets.symmetric(horizontal: 5),
        validators: [Validators.mustMatch("password", "confirmPassword")],
        fieldsMeta: [
          FieldMeta<TextFieldProps>(
            fieldKey: "password",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              disabled: false,
              hidden: false,
              hintText: "Nouveau mot de passe",
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
              disabled: false,
              hidden: false,
              hintText: "Confirmer mot de passe",
              textFieldType: HMTextFieldType.password,
              keyboardType: TextInputType.visiblePassword,
              onTap: () => print("confirmPassword"),
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
    SizeConfig().init(context);
    return AuthLayout(
      hasBackButton: false,
      header: Column(
        children: [
          Text(
            "Nouveau mot de passe",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: titleTextColor,
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                height: 1.15),
          ),
          // 5.py,
          Text(
            "Veuillez créer un nouveau mot de passe pour continuer.",
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
        text: "Mettre à jour",
        onPress: () {
          //
          AuthRoute().go(context);
        },
      ),
    );
  }
}
