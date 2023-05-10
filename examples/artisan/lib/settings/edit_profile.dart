import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../auth/store/user_store.dart';
import '../common/widgets/snackbar.dart';
import '../common/widgets/submit_button.dart';
import '../core/useservice.dart';

class EditProfilePage extends HookWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = useService<UserStore>();
    final defaultValue = {
      "firstName": userStore.user.contact.firstName,
      "lastName": userStore.user.contact.lastName
    };
    final fieldsGroupMeta = [
      FieldGroup(
        groupName: '',
        padding: const EdgeInsets.symmetric(horizontal: 5),
        fieldsMeta: [
          FieldMeta<TextFieldProps>(
            fieldKey: "lastName",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Nom",
              textFieldType: HMTextFieldType.text,
              keyboardType: TextInputType.text,
              onTap: () => print("lastname"),
              onChange: (String val) {
                // print(val);
              },
            ),
          ),
          FieldMeta<TextFieldProps>(
            fieldKey: "firstName",
            options: [Validators.required],
            subscribe: true,
            customProps: TextFieldProps(
              hintText: "Prenom",
              textFieldType: HMTextFieldType.text,
              keyboardType: TextInputType.text,
              onTap: () => print("firstname"),
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
        defaultValue: defaultValue,
        onChangeValidation: false);
    final handleSubmit = form.handleSubmit;

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: HMIconButton(
          icon: SvgPicture.asset(Assets.icons.arrowLeft),
          radius: HMRadius.xl,
          buttonVariant: HMButtonVariant.transparent,
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Editer le profile",
          style: TextStyle(
              color: titleTextColor,
              fontWeight: FontWeight.w500,
              fontSize: getProportionateScreenWidth(16)),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          physics: const BouncingScrollPhysics(),
          children: [
            HMReactiveForm(
                form: form,
                fieldMeta: fieldsGroupMeta,
                decoratedWidget: (child) => child),
            getProportionateScreenHeight(15).py,
            Row(
              children: [
                SvgPicture.asset(Assets.icons.info),
                getProportionateScreenWidth(10).px,
                Expanded(
                  child: Text.rich(
                    TextSpan(
                        text: "Veuillez noter : ",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenWidth(12)),
                        children: const [
                          TextSpan(
                            text:
                                "Si vous changer votre nom sur Blounoumi, vous ne pourrez plus le modifier pendant 60jours. N’y ajoutez aucune majuscule ou ponctuation inhabituelle, aucun caractère spécial ou aucun mot aléatoire. ",
                            style: TextStyle(
                                color: labelTextColor,
                                fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: "En savoir plus.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ]),
                  ),
                ),
              ],
            ),
            getProportionateScreenHeight(89).py,
            SubmitButton(
              text: "Modifier",
              onPress: () {
                handleSubmit(
                  (data) {
                    userStore.editProfile(data);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.transparent,
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          content: SuccessMessage(
                              message: 'Modification éffectuée avec success')),
                    );
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
