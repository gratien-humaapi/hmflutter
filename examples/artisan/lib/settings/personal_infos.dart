import 'package:artisan/auth/store/user_store.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/constant.dart';
import '../common/size_config.dart';

class PersonalInformationsPage extends StatelessWidget {
  const PersonalInformationsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = useService<UserStore>();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: HMIconButton(
            icon: SvgPicture.asset(
              Assets.icons.arrowLeft,
              // width: 25,
            ),
            buttonVariant: HMButtonVariant.transparent,
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Informations personnelles",
          style: TextStyle(
              color: titleTextColor,
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        children: [
          //
          InfoGroup(
            title: "Informations générales",
            infoItems: [
              InfoItem(
                icon: SvgPicture.asset(Assets.icons.profile),
                label: "Nom et Prénom",
                title: userStore.user.contact.fullName,
                hasEditButton: true,
                editButtonPressed: () {
                  //
                },
              ),
              InfoItem(
                icon: SvgPicture.asset(Assets.icons.flag),
                label: "Langue",
                title: "Français",
                hasEditButton: false,
              ),
            ],
          ),
          getProportionateScreenHeight(24).py,
          //
          InfoGroup(
            title: "Catégories d’activité",
            infoItems: [
              InfoItem(
                icon: SvgPicture.asset(Assets.icons.folder),
                title: "Menuiserie",
                hasEditButton: false,
              ),
            ],
          ),
          getProportionateScreenHeight(24).py,
          //
          InfoGroup(
            title: "Coordonnées",
            infoItems: [
              InfoItem(
                icon: SvgPicture.asset(Assets.icons.call),
                title: userStore.user.contact.phone,
                hasEditButton: true,
                editButtonPressed: () {
                  //
                },
              ),
              InfoItem(
                icon: SvgPicture.asset(Assets.icons.sms),
                title: userStore.user.contact.email,
                hasEditButton: true,
                editButtonPressed: () {
                  //
                },
              ),
              InfoItem(
                icon: SvgPicture.asset(Assets.icons.locationTick),
                title:
                    "${userStore.user.address.city}, ${userStore.user.address.country}",
                hasEditButton: true,
                editButtonPressed: () {
                  //
                },
              ),
              InfoItem(
                icon: SvgPicture.asset(Assets.icons.autobrightness),
                label: "Numéro RCCM / Numéro professionel",
                title: userStore.user.professionalNumber,
                hasEditButton: true,
                editButtonPressed: () {
                  //
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.icon,
    this.label,
    required this.title,
    required this.hasEditButton,
    this.editButtonPressed,
  });

  final Widget icon;
  final String? label;
  final String title;
  final bool hasEditButton;
  final void Function()? editButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      margin: const EdgeInsets.only(bottom: 6),
      height: getProportionateScreenHeight(50),
      child: Row(
        children: [
          icon,
          getProportionateScreenWidth(10).px,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label != null)
                  Text(
                    label!,
                    style: TextStyle(
                      color: labelTextColor,
                      fontSize: getProportionateScreenWidth(10),
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: titleTextColor,
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ],
            ),
          ),
          if (hasEditButton)
            HMButton(
              content: 'Modifier',
              textColor: primaryColor,
              buttonVariant: HMButtonVariant.transparent,
              size: HMButtonSize.sm,
              onPressed: () {
                if (editButtonPressed != null) {
                  editButtonPressed!();
                }
              },
            ),
        ],
      ),
    );
  }
}

class InfoGroup extends StatelessWidget {
  const InfoGroup({
    super.key,
    required this.title,
    required this.infoItems,
  });
  final String title;
  final List<InfoItem> infoItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: titleTextColor,
            fontSize: getProportionateScreenWidth(14),
            fontWeight: FontWeight.w500,
          ),
        ),
        getProportionateScreenHeight(10).py,
        ...infoItems,
      ],
    );
  }
}
