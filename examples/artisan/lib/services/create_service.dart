import 'package:artisan/appshell/appshell_routes.dart';
import 'package:artisan/core/models/item_service/item_service.dart';
import 'package:artisan/core/models/item_service_option/item_service_option.dart';
import 'package:artisan/core/models/service/service.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';
import 'package:mobx/mobx.dart';

import '../auth/store/user_store.dart';
import '../common/constant.dart';
import '../common/flash_message/show_flash_message.dart';
import '../common/image_picker_builder.dart';
import '../common/size_config.dart';
import '../common/widgets/hm_stepper.dart';
import '../core/enums/user_service_option.dart';
import '../core/models/user_service/user_service.dart';
import '../core/useservice.dart';
import '../homepage/homepage.routing.dart';
import '../fakedata/services.dart';
import '../utils/helpers.dart';
import 'store/service_store.dart';
import 'store/services_store.dart';

final _defautlValue = {
  'serviceTitle': '',
  'serviceCategory': '',
  'prestations': '',
  'description': '',
  'serviceImage': <XFile>[],
  'tarification': '',
  'tarifMinimum': ''
};

class CreateService extends HookWidget {
  const CreateService({
    super.key,
    required this.hasBackButton,
  });

  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final pageController = usePageController(initialPage: 0);
    final currentPage = useState(0);
    final itemServices = useState(<ItemService>[]);
    final suggestedServices = useState(<Service>[]);
    // final serviceItemOptions = useState(<ItemServiceOption>[]);
    final UserStore userStore = useService<UserStore>();
    final ServiceStore serviceStore = useService<ServiceStore>();

    // Load services by user job id
    serviceStore.services(userStore.user.job.id);

    useEffect(() {
      suggestedServices.value = serviceStore.partialServices;
      print("object");
    }, []);

    final List fieldKeyList = [
      [
        'serviceTitle',
        'service',
        'prestation',
        'description',
        // 'serviceImage',
        // 'pickedImage',
      ],
      ['tarification', 'tarifMinimum'],
    ];

    // First bloc
    final bloc1 = FieldGroup(groupName: '', fieldsMeta: [
      FieldMeta<TextFieldProps>(
        fieldKey: "serviceTitle",
        options: [Validators.required],
        subscribe: true,
        customProps: TextFieldProps(
          hintText: "Titre du service",
          textFieldType: HMTextFieldType.text,
          keyboardType: TextInputType.text,
          onChange: (String val) {
            // print(val);
          },
        ),
      ),
      FieldMeta<SelectProps>(
        fieldKey: "service",
        options: [Validators.required],
        subscribe: true,
        customProps: SelectProps(
          hintText: "Service",
          selectedBgColor: fillColor,
          isModalView: true,
          hasDivider: false,
          modalRadius: 32,
          closeIcon: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              Assets.icons.close,
            ),
          ),
          selectItemStyle: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              fontWeight: FontWeight.w500),
          selectIcon: SvgPicture.asset(
            Assets.icons.check,
            height: 40,
            width: 40,
          ),
          selectionPageTitle: Text(
            "Sélectionner votre categorie",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w500),
          ),
          onChange: (String value) {
            final Service service = serviceStore.serviceByName(value);
            itemServices.value = serviceStore.prestations(service.id);
          },
          selectList: serviceStore.partialServices.map((e) => e.name).toList(),
        ),
      ),
    ]);

    // Description field
    final bloc2 = FieldGroup(
      groupName: '',
      fieldsMeta: [
        FieldMeta<SelectProps>(
          fieldKey: "prestation",
          options: [Validators.required],
          subscribe: true,
          customProps: SelectProps(
            hasDivider: false,
            modalRadius: 32,
            closeIcon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(
                Assets.icons.close,
              ),
            ),
            hintText: "Vos prestations",
            selectedBgColor: fillColor,
            selectIcon: SvgPicture.asset(
              Assets.icons.check,
              height: 40,
              width: 40,
            ),
            selectionPageTitle: Text(
              "Vôtre prestation",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w500),
            ),
            isModalView: true,
            selectList: itemServices.value.map((e) => e.name).toList(),
            onChange: (String value) {
              // print(val);
            },
          ),
        ),
        FieldMeta<TextFieldProps>(
          fieldKey: "description",
          options: [Validators.required],
          subscribe: true,
          customProps: TextFieldProps(
            hintText: "Descriptions",
            textFieldType: HMTextFieldType.multiline,
            keyboardType: TextInputType.multiline,
            radius: HMRadius.lg,
            // contentPadding: EdgeInsets.symmetric(vertical: 5),
            minLines: 4,
            maxLines: 6,
            onChange: (String val) {
              // print(val);
            },
          ),
        ),
      ],
    );

    // Image Field
    final imageBloc = FieldGroup(
      groupName: '',
      fieldsMeta: [
        // FieldMeta(
        //   fieldKey: "serviceImage",
        //   options: [Validators.required],
        //   subscribe: true,
        // ),
        FieldMeta<ImagePickerProps>(
          fieldKey: 'serviceImage', //"pickedImage",
          options: [],
          subscribe: true,
          customProps: ImagePickerProps(
            isMultipleImage: true,
            hasCancelButton: false,
            builder: imagePickerBuilder,
            imageSourceList: (isMultipleImage, pickedImage, pickMultiImage,
                pickSingleImage) {
              return [
                ActionSheetItem(
                  onPressed: () {
                    pickSingleImage(ImageSource.gallery);
                  },
                  title: const Text(
                    'Importer depuis votre galerie',
                    style: TextStyle(
                        color: titleTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  icon: SvgPicture.asset(Assets.icons.import),
                ),
                ActionSheetItem(
                  onPressed: () {
                    //
                  },
                  title: const Text(
                    'Sélectionner dans le portfolio',
                    style: TextStyle(
                        color: titleTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  icon: SvgPicture.asset(Assets.icons.addItem),
                ),
              ];
            },
            onChange: (List<XFile> images) {
              // print(val);
            },
          ),
        ),
      ],
    );

    // Tarif bloc
    final tarifbloc = FieldGroup(groupName: '', fieldsMeta: [
      FieldMeta<SelectProps>(
        fieldKey: "tarification",
        options: [Validators.required],
        subscribe: true,
        customProps: SelectProps(
          hintText: "Type Tarifications",
          hasDivider: false,
          modalRadius: 32,
          selectItemStyle: TextStyle(
              color: titleTextColor,
              fontSize: getProportionateScreenWidth(14),
              fontWeight: FontWeight.w500),
          closeIcon: SvgPicture.asset(
            Assets.icons.close,
          ),
          selectedBgColor: fillColor,
          selectIcon: SvgPicture.asset(
            Assets.icons.check,
            height: 30,
            width: 30,
          ),
          selectionPageTitle: Text(
            "Vos prestations",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w500),
          ),
          onChange: (String val) {
            print(val);
          },
          isModalView: true,
          selectList: [
            "Tarif horaire",
            "Tarif forfaitaire",
            "Système de quotas",
            "Système d'abonnement"
          ],
        ),
      ),
      FieldMeta<TextFieldProps>(
        fieldKey: "tarifMinimum",
        options: [Validators.required],
        subscribe: true,
        customProps: TextFieldProps(
          hintText: "Tarif minimum",
          textFieldType: HMTextFieldType.number,
          keyboardType: TextInputType.number,
          onChange: (String val) {
            // print(val);
          },
        ),
      ),
    ]);

    final form = useForm(
        fieldGroups: [bloc1, bloc2, imageBloc, tarifbloc],
        defaultValue: _defautlValue,
        onChangeValidation: true);
    final handleSubmit = form.handleSubmit;

    List<HMStep> steps = [
      HMStep(
        title: Text(
          "Aperçu",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(24),
              fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: TextStyle(color: Color(0xFF929292)),
        ),
        inputFields: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HMReactiveForm(
                form: form,
                fieldMeta: [bloc1],
                decoratedWidget: (child) => child),
            // getProportionateScreenHeight(9).py,
            Visibility(
              visible: suggestedServices.value.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Text(
                      'Suggestions de service',
                      style: TextStyle(
                          color: titleTextColor,
                          fontSize: getProportionateScreenWidth(10)),
                    ),
                  ),
                  HMSelectBadge(
                    direction: Axis.vertical,
                    chipColor: fillColor,
                    selectedList: suggestedServices.value
                        .map((e) => HMSelectedItem(
                            label: Text(
                              e.name,
                              style: TextStyle(
                                  color: chipsColor,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                            value: e.id))
                        .toList(),
                    onDeleted: (value) {
                      print(value);
                      List<Service> a = List.from(suggestedServices.value);
                      a.removeWhere((element) => element.id == value);
                      suggestedServices.value = a;
                    },
                    onTap: (index) {
                      form.form.control('service').value =
                          suggestedServices.value[index].name;
                      itemServices.value = serviceStore
                          .prestations(suggestedServices.value[index].id);
                    },
                  ),
                  // Observer(
                  //   builder: (context) {
                  //     return Text("${serviceStore.partialItemServices}");
                  //   },
                  // ),
                ],
              ),
            ),
            getProportionateScreenHeight(14).py,
            HMReactiveForm(
                form: form,
                fieldMeta: [bloc2],
                decoratedWidget: (child) => child),
            getProportionateScreenHeight(14).py,
            HMReactiveForm(
                form: form,
                fieldMeta: [imageBloc],
                decoratedWidget: (child) => child),
          ],
        ),
        infoText: Row(
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
                            "Certaines catégories exigent que les artisans vérifient leurs compétences.",
                        style: TextStyle(
                            color: labelTextColor,
                            fontWeight: FontWeight.normal),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),

      //
      HMStep(
        title: const Text(
          "Tarifications",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: TextStyle(color: Color(0xFF929292)),
        ),
        inputFields: HMReactiveForm(
            form: form,
            fieldMeta: [tarifbloc],
            decoratedWidget: (child) => child),
      ),
    ];
    return Scaffold(
      appBar: hasBackButton
          ? AppBar(
              forceMaterialTransparency: true,
              leadingWidth: 80,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.icons.arrowLeft),
                      8.px,
                      const Text("Back", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          margin: EdgeInsets.only(top: getProportionateScreenHeight(27)),
          child: HMStepper(
            controller: pageController,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            endText: "Publier",
            currentStep: currentPage.value,
            onStepChange: (value) {
              currentPage.value = value;
            },
            steps: steps,
            onStepContinue: () {
              bool isValid = checkValidFormControls(
                  form.form, fieldKeyList[currentPage.value]);
              print(form.form.value);
              if (currentPage.value == steps.length - 1) {
                handleSubmit((data) {
                  print(data);
                  //
                  final UserService newService = UserService(
                    id: '${DateTime.now()}',
                    name: data['serviceTitle'],
                    isActive: true,
                    referenceNumber: '202223',
                    createdAt: '${DateTime.now()}',
                    updatedAt: '${DateTime.now()}',
                    options: [],
                    owner: userStore.user.id,
                    reviewers: [],
                    status: UserServiceOptionStatusEnum.published.value,
                    updatedBy: userStore.user.id,
                    service: servicesData[0],
                    description: data['description'],
                    serviceImage: data['serviceImage'].isNotEmpty
                        ? data['serviceImage'].first.path
                        : null,
                    tarification: data['tarification'],
                    tarifMinimum: data['tarifMinimum'],
                  );
                  userStore.addService(newService);

                  // context.go("/");
                  context.pop();
                  createHighlightOverlay(context);
                });
              }
              if (isValid) {
                print("Yes valid");
                pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut);
              }
            },
            onStepCancel: () {
              pageController.previousPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut);
            },
          ),
        ),
      ),
    );
  }
}
