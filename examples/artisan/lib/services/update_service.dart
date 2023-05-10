import 'package:artisan/auth/store/user_store.dart';
import 'package:artisan/core/models/user_service/user_service.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/services/store/services_store.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/constant.dart';
import '../common/image_picker_builder.dart';
import '../common/size_config.dart';
import '../common/widgets/submit_button.dart';
import 'store/service_store.dart';

class UpdateService extends HookWidget {
  const UpdateService({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    print(id);

    final ServiceStore serviceStore = useService<ServiceStore>();
    final UserStore userStore = useService<UserStore>();
    // serviceStore.services();
    final UserService service = userStore.userServices[0];
    print(service.toJson());
    final defaultValue = {
      'serviceTitle': service.name,
      'serviceCategory': service.service.name,
      'description': service.description,
      'serviceImage':
          service.serviceImage != null ? [XFile(service.serviceImage!)] : [],
      'tarification': service.tarification,
      'tarifMinimum': service.tarifMinimum
    };

    final bloc1 = FieldGroup(
      groupName: '',
      fieldsMeta: [
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
        FieldMeta<TextFieldProps>(
          fieldKey: "serviceCategory",
          options: [Validators.required],
          subscribe: true,
          customProps: TextFieldProps(
            disabled: true,
            // disabledTextColor: Color(0xFFBFBFBF),
            textFieldType: HMTextFieldType.text,
            keyboardType: TextInputType.text,
            onChange: (String val) {
              // print(val);
            },
          ),
        ),
      ],
    );

    // Description field
    final descriptionBloc = FieldGroup(
      groupName: '',
      fieldsMeta: [
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
        FieldMeta<ImagePickerProps>(
          fieldKey: "serviceImage",
          options: [Validators.required],
          subscribe: true,
          customProps: ImagePickerProps(
            isMultipleImage: true,
            hasCancelButton: false,
            builder: imagePickerBuilder,
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
            height: 40,
            width: 40,
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
          // selectIconColor: primaryColor,
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
        fieldGroups: [bloc1, descriptionBloc, imageBloc, tarifbloc],
        defaultValue: defaultValue,
        onChangeValidation: true);
    final handleSubmit = form.handleSubmit;

    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              HMIconButton(
                icon: SvgPicture.asset(Assets.icons.arrowLeft),
                iconColor: iconColor,
                buttonVariant: HMButtonVariant.transparent,
                onPressed: () {
                  context.pop();
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Editer le service',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            children: [
              HMReactiveForm(
                form: form,
                fieldMeta: [bloc1],
                decoratedWidget: (child) => child,
              ),
              getProportionateScreenHeight(26).py,
              HMReactiveForm(
                form: form,
                fieldMeta: [descriptionBloc],
                decoratedWidget: (child) => child,
              ),
              getProportionateScreenHeight(26).py,
              HMReactiveForm(
                form: form,
                fieldMeta: [imageBloc],
                decoratedWidget: (child) => child,
              ),
              getProportionateScreenHeight(48).py,
              HMReactiveForm(
                form: form,
                fieldMeta: [tarifbloc],
                decoratedWidget: (child) => child,
              ),
              getProportionateScreenHeight(48).py,
              SubmitButton(
                text: "Mettre à jour",
                onPress: () {
                  handleSubmit(
                    (data) {
                      final newService = UserService(
                        id: service.id,
                        name: data['serviceTitle'],
                        status: service.status,
                        description: data['description'],
                        serviceImage: (data['serviceImage'] as List).first.path,
                        owner: service.owner,
                        updatedBy: service.updatedBy,
                        reviewers: service.reviewers,
                        options: service.options,
                        isActive: service.isActive,
                        referenceNumber: service.referenceNumber,
                        service: service.service,
                        tarifMinimum: data['tarifMinimum'],
                        tarification: data['tarification'],
                        createdAt: service.createdAt,
                        updatedAt: '${DateTime.now()}',
                      );
                      // serviceStore.updateService(newService);
                      context.pop();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
