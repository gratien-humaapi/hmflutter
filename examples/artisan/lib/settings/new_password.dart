import 'package:artisan/auth/auth_service.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/core/sdk/hm_auth_sdk.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/snackbar.dart';
import '../common/widgets/submit_button.dart';

class NewPasswordPage extends HookWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = useService<AuthService>();
    final fieldsGroupMeta = [
      FieldGroup(
        groupName: '',
        validators: [
          Validators.mustMatch("proposedPassword", "confirmPassword")
        ],
        fieldsMeta: [
          FieldMeta<TextFieldProps>(
            fieldKey: "previousPassword",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Mot de passe actuel",
              textFieldType: HMTextFieldType.password,
              keyboardType: TextInputType.visiblePassword,
              onChange: (String val) {
                // print(val);
              },
            ),
          ),
          FieldMeta<TextFieldProps>(
            fieldKey: "proposedPassword",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Nouveau mot de passe",
              textFieldType: HMTextFieldType.password,
              keyboardType: TextInputType.visiblePassword,
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
              hintText: "Confirmer le nouveau mot de passe",
              textFieldType: HMTextFieldType.password,
              keyboardType: TextInputType.visiblePassword,
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
    return Scaffold(
      appBar: AppBar(
        leading: HMIconButton(
          icon: SvgPicture.asset(Assets.icons.arrowLeft),
          radius: HMRadius.xl,
          fillColor: fillColor,
          buttonVariant: HMButtonVariant.transparent,
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Mot de passe",
          style: TextStyle(
              color: titleTextColor,
              fontWeight: FontWeight.w500,
              fontSize: getProportionateScreenWidth(16)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pour definir un nouveau mot de passe, indiquez d'abord votre mot de passe actuel.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: labelTextColor,
                      fontSize: getProportionateScreenWidth(14)),
                ),
                getProportionateScreenHeight(30).py,
                HMReactiveForm(
                    form: form,
                    fieldMeta: fieldsGroupMeta,
                    decoratedWidget: (child) => child),
                getProportionateScreenHeight(50).py,
                SubmitButton(
                  text: "Confirmer",
                  onPress: () {
                    handleSubmit(
                      (data) async {
                        try {
                          final bool res =
                              await authService.changePassword(data);
                          if (res) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.transparent,
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  content: SuccessMessage(
                                      message:
                                          'Modification éffectuée avec success')),
                            );
                          }
                        } on HMAuthSDKError catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.transparent,
                                behavior: SnackBarBehavior.floating,
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                content: ErrorMessage(message: e.message)),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
