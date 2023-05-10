import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/core/models/contact/contact.dart';
import 'package:artisan/core/models/user/user_class.dart';
import 'package:artisan/core/enums/user_status.dart';
import 'package:artisan/core/enums/user_type.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/more_info/more_info.routing.dart';
import 'package:artisan/more_info/store/more_info_store.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../auth/store/user_store.dart';
import '../common/widgets/hm_stepper.dart';
import '../core/useservice.dart';
import '../utils/helpers.dart';

Map<String, dynamic> defaultValue = {
  "userType": "Craftman",
  "job": "",
  "professionalNumber": "",
  "bio": "",
  "zone": "",
  "address": "",
  "experience": ""
};

class CraftmanInfoPage extends HookWidget {
  const CraftmanInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final pageController = usePageController(initialPage: 0);
    final currentPage = useState(0);
    final UserStore userStore = useService<UserStore>();
    final MoreInfoStore moreInfoStore = useService<MoreInfoStore>();

    List<String> metiersArtisan = [
      "Menuisier",
      "Cordonnier",
      "Couturier",
      "Maroquinier",
      "Potier",
      "Bijoutier",
      "Vitrier",
      "Tapissier",
      "Ebéniste",
      "Serrurier",
      "Forgeron",
      "Luthier",
      "Horloger",
      "Sculpteur",
      "Céramiste",
      "Graveur",
      "Doreur",
      "Relieur",
      "Ferronnier",
      "Verrier"
    ];

    List<String> experiencesMenuisier = [
      "Fabrication d'une table en bois massif",
      "Création d'une armoire de rangement sur mesure",
      "Réparation d'une chaise en bois",
      "Fabrication d'un escalier en bois",
      "Création d'une bibliothèque encastrée",
      "Réparation d'un plancher en bois",
      "Fabrication d'un banc de jardin en bois",
      "Création d'un présentoir à bijoux en bois"
    ];

    final List fieldKeyList = [
      'job',
      [
        'professionalNumber',
        'bio',
        'addressOfTheCompany',
        'areaOfIntervention'
      ],
    ];

    final category = FieldGroup(groupName: '', fieldsMeta: [
      FieldMeta<AutocompleteProps>(
        fieldKey: "job",
        options: [Validators.required],
        subscribe: true,
        customProps: AutocompleteProps(
          hintText: "Enter someting",
          modalRadius: 32,
          optionsTextStyle: TextStyle(
            color: titleTextColor,
            fontSize: getProportionateScreenWidth(14),
          ),
          optionsPaddding: EdgeInsets.only(
              left: getProportionateScreenWidth(18),
              right: getProportionateScreenWidth(18),
              bottom: getProportionateScreenHeight(20)),
          fieldViewBuilder:
              (context, controller, showClearButton, onChangedField) {
            return Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(18),
                  right: getProportionateScreenWidth(18),
                  top: getProportionateScreenHeight(20),
                  bottom: getProportionateScreenHeight(16)),
              child: HMTextField(
                controller: controller,
                fillColor: fillColor,
                radius: HMRadius.xl,
                size: HMTextFieldSize.md,
                prefixIcon: SizedBox(
                  child: SvgPicture.asset(
                    Assets.icons.search,
                  ),
                ),
                suffixIcon: showClearButton
                    ? GestureDetector(
                        child: SvgPicture.asset(Assets.icons.close),
                        onTap: () {
                          onChangedField('');
                          controller.clear();
                        },
                      )
                    : null,
                hintText: "Rechercher votre categorie d'activité",
                onChange: (value) => onChangedField(value),
              ),
            );
          },
          selectedIcon: SvgPicture.asset(Assets.icons.check),
          optionsBuilder: (value) {
            // moreInfoStore.getSubProfessionById('c440d945-6620-414c-9b4d-c5e7bfeff053');
            // final data = moreInfoStore.getSubProfessionList();
            // print('here data : $data');
            List<String> data = moreInfoStore
                .getSubProfessionList()
                .map((e) => e.name)
                .toList();
            // print('here $data');
            if (value.isEmpty) {
              return data;
            }
            return data
                .where((element) =>
                    element.toLowerCase().contains(value.toLowerCase()))
                .toList();
          },
          onSelected: (value) {
            // print(value);
          },
        ),
      ),
    ]);
    //
    final moreInfos = FieldGroup(
      groupName: '',
      // padding: const EdgeInsets.symmetric(horizontal: 5),
      // validators: [Validators.mustMatch("password", "confirmPassword")],
      fieldsMeta: [
        FieldMeta<TextFieldProps>(
          fieldKey: "professionalNumber",
          options: [Validators.required],
          subscribe: true,
          customProps: TextFieldProps(
            hintText: "RRCM/Numéro professionel",
            textFieldType: HMTextFieldType.text,
            keyboardType: TextInputType.text,
            onChange: (String val) {
              // print(val);
            },
          ),
        ),
        FieldMeta<TextFieldProps>(
          fieldKey: "bio",
          options: [Validators.required],
          subscribe: true,
          customProps: TextFieldProps(
            hintText: "Décrivez vous en quelque ligne",
            textFieldType: HMTextFieldType.multiline,
            keyboardType: TextInputType.multiline,
            // contentPadding: EdgeInsets.symmetric(vertical: 5),
            minLines: 4,
            maxLines: 6,
            onChange: (String val) {
              // print(val);
            },
          ),
        ),
        FieldMeta<SelectProps>(
          fieldKey: "areaOfIntervention",
          options: [Validators.required],
          subscribe: true,
          customProps: SelectProps(
            hintText: "Votre zone d'intervention",
            hasDivider: false,
            modalRadius: 32,
            closeIcon: Container(
              padding: const EdgeInsets.all(0.0),
              // height: 40,
              // width: 40,
              child: SvgPicture.asset(
                Assets.icons.close,
              ),
            ),
            selectedBgColor: fillColor,
            selectItemStyle: TextStyle(
                color: titleTextColor,
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w500),
            selectIcon: SvgPicture.asset(
              Assets.icons.check,
              height: 40,
              width: 40,
            ),
            isModalView: true,
            selectList: [
              'Cotonou',
              'Porto-Novo',
              'Calavi',
              'Parakou',
              'Bohicon'
            ],
            onChange: (String val) {
              print(val);
            },
            selectionPageTitle: Text(
              "Sélectionner une adresse",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        FieldMeta<SelectProps>(
          fieldKey: "addressOfTheCompany",
          options: [Validators.required],
          subscribe: true,
          customProps: SelectProps(
            hintText: "Adresse de l'entreprise",
            hasDivider: false,
            modalRadius: 32,
            closeIcon: Container(
              padding: const EdgeInsets.all(0.0),
              // height: 40,
              // width: 40,
              child: SvgPicture.asset(
                Assets.icons.close,
              ),
            ),
            selectedBgColor: fillColor,
            selectItemStyle: TextStyle(
                color: titleTextColor,
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w500),
            selectIcon: SvgPicture.asset(
              Assets.icons.check,
              height: 40,
              width: 40,
            ),
            isModalView: true,
            selectList: [
              'Cotonou',
              'Porto-Novo',
              'Calavi',
              'Parakou',
              'Bohicon'
            ],
            onChange: (String val) {
              print(val);
            },
            selectionPageTitle: Text(
              "Sélectionner une adresse",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),

        // FieldMeta<TextFieldProps>(
        //   fieldKey: "experience",
        //   options: [Validators.required],
        //   subscribe: true,
        //   customProps: TextFieldProps(
        //     hintText: "Année d’expérience",
        //     textFieldType: HMTextFieldType.text,
        //     keyboardType: TextInputType.text,
        //     onChange: (String val) {
        //       // print(val);
        //     },
        //   ),
        // ),
      ],
    );

    final form = useForm(
        fieldGroups: [category, moreInfos],
        // defaultValue: defaultValue,
        onChangeValidation: true);
    final handleSubmit = form.handleSubmit;

    List<HMStep> steps = [
      // 1
      HMStep(
        title: Text(
          "Quelle est votre catégorie d’activité?",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(26),
              color: titleTextColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: TextStyle(
              color: labelTextColor, fontSize: getProportionateScreenWidth(12)),
        ),
        inputFields: HMReactiveForm(
            form: form,
            fieldMeta: [category],
            decoratedWidget: (child) => child),
      ),
      // 2
      HMStep(
        title: Text(
          "Informations supplémentaires",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(26),
              color: titleTextColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: TextStyle(
              color: labelTextColor, fontSize: getProportionateScreenWidth(12)),
        ),
        inputFields: HMReactiveForm(
            form: form,
            fieldMeta: [moreInfos],
            decoratedWidget: (child) => child),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(50)),
            child: HMStepper(
              controller: pageController,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(28)),
              endText: "Confirmer",
              currentStep: currentPage.value,
              onStepChange: (value) {
                currentPage.value = value;
                print(currentPage.value);
              },
              steps: steps,
              onStepContinue: () {
                bool isValid = checkValidFormControls(
                    form.form, fieldKeyList[currentPage.value]);
                if ((currentPage.value == steps.length - 1) /* && isValid */) {
                  // print("yes");
                  handleSubmit((data) {
                    // print(data);
                    final newUser = User(
                      id: '${DateTime.now()}',
                      status: UserStatusEnum.active.value,
                      verified: true,
                      createdAt: "${DateTime.now()}",
                      updatedAt: "${DateTime.now()}",
                      contact: Contact.fromJson({
                        'email': "user1@gmail.com",
                        'verifiedEmail': true,
                        'phone': '+123456449845',
                        'acceptTOS': true,
                        ...(data['contact'] as Map<String, dynamic>)
                      }),
                      address: moreInfoStore.getAddressById(data['address']),
                      userType: UserTypeEnum.contractor.value,
                      job: moreInfoStore.getSubProfession(data['job']),
                      bio: data['bio'],
                      addressOfTheCompany: moreInfoStore
                          .getAddressById(data['addressOfTheCompany']),
                      areaOfIntervention: moreInfoStore
                          .getAddressById(data['areaOfIntervention']),
                      professionalNumber: data['professionalNumber'],
                    );

                    // print(newUser.toJson());
                    userStore.saveUser(newUser);
                    AddProfileImageRoute().pushReplacement(context);
                  });
                }

                if (isValid) {
                  // print(form.form.control(fieldKeyList[currentPage.value]).value);
                  print("Yes valid");
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut);
                }

                // if (form.form.valid) {
                //   pageController.nextPage(
                //       duration: const Duration(milliseconds: 100),
                //       curve: Curves.easeInOut);
                // }
                // pageController.nextPage(
                //     duration: const Duration(milliseconds: 100),
                //     curve: Curves.easeInOut);
              },
              onStepCancel: () {
                pageController.previousPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut);
              },
            ),
          ),
        ),
      ),
    );
  }
}
