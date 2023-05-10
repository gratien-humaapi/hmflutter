import 'dart:io';

import 'package:artisan/appshell/appshell_routes.dart';
import 'package:artisan/auth/store/user_store.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/homepage/widgets/searchfield.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../../notification/notification_page.routing.dart';

class CraftmanHeaderSection extends StatelessWidget {
  const CraftmanHeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = useService<UserStore>();
    SizeConfig().init(context);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      // floating: true,
      // pinned: true,
      leadingWidth: getProportionateScreenWidth(60),
      // collapsedHeight: getProportionateScreenWidth(38),
      toolbarHeight: getProportionateScreenWidth(50),
      leading: GestureDetector(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => ProfilePage()),
          // );
          GoRouter.of(context).go('/profile');
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
          ),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFE9E9E9),
            backgroundImage: userStore.user.contact.image != null
                ? FileImage(File(userStore.user.contact.image!))
                : null,
            child: userStore.user.contact.image == null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(Assets.icons.profile))
                : null,
          ),
        ),
      ),
      title: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hello',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(12),
                color: labelTextColor,
              )),
          Text(
            '${userStore.user.contact.lastName} ${userStore.user.contact.firstName}',
            style: TextStyle(
                color: subtitleColor,
                fontWeight: FontWeight.w500,
                fontSize: getProportionateScreenWidth(14)),
          ),
        ],
      ),

      actions: [
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(15)),
          child: HMIconButton(
            buttonVariant: HMButtonVariant.transparent,
            icon: SvgPicture.asset(Assets.icons.notification, color: iconColor),
            onPressed: () {
              // GoRouter.of(context).go('/notification');
              NotificationPageRoute().push(context);
            },
          ),
        ),
      ],
      expandedHeight: getProportionateScreenWidth(120),

      flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1.0,
          background: Column(
            children: [
              getProportionateScreenWidth(60).py,
              const SearchField(
                hintText: 'What services do you need?',
              ),
              // getProportionateScreenWidth(10).py,
            ],
          )),
    );
  }
}

final List<String> villes = [
  "Cotonou",
  "Bohicon",
  "Parakou",
  "Ouidah",
  "Calavi",
  "Porto-Novo"
];

class CustomerHeaderSection extends StatelessWidget {
  const CustomerHeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = useService<UserStore>();
    SizeConfig().init(context);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      // floating: true,
      // pinned: true,
      leadingWidth: getProportionateScreenWidth(60),
      // collapsedHeight: getProportionateScreenWidth(38),
      toolbarHeight: getProportionateScreenWidth(50),
      leading: GestureDetector(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => ProfilePage()),
          // );
          GoRouter.of(context).go('/profile');
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
          ),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFE9E9E9),
            backgroundImage: userStore.user.contact.image != null
                ? FileImage(File(userStore.user.contact.image!))
                : null,
            child: userStore.user.contact.image == null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(Assets.icons.profile))
                : null,
          ),
        ),
      ),
      title: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hello',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(12),
                color: labelTextColor,
              )),
          Text(
            '${userStore.user.contact.lastName} ${userStore.user.contact.firstName}',
            style: TextStyle(
                color: subtitleColor,
                fontWeight: FontWeight.w500,
                fontSize: getProportionateScreenWidth(14)),
          ),
        ],
      ),

      actions: [
        HMIconButton(
          buttonVariant: HMButtonVariant.transparent,
          icon: Stack(
            children: [
              SvgPicture.asset(Assets.icons.message, color: iconColor),
              Positioned(
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  height: 8,
                  width: 8,
                ),
              ),
            ],
          ),
          onPressed: () {
            //
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
          child: HMIconButton(
            buttonVariant: HMButtonVariant.transparent,
            icon: SvgPicture.asset(Assets.icons.sort, color: iconColor),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.6,
                    child: Material(
                      // borderRadius:
                      //     BorderRadius.vertical(top: Radius.circular(20)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: HMIconButton(
                                buttonVariant: HMButtonVariant.transparent,
                                icon: SvgPicture.asset(
                                  Assets.icons.closeCircle,
                                  color: iconColor,
                                ),
                                onPressed: () => Navigator.pop(context)),
                          ),
                          Expanded(
                            child: ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              children: [
                                HMSelect(
                                  value: "",
                                  selectList: villes,
                                  hintText: "Sélectionner une ville",
                                  selectionPageTitle:
                                      const Text("Sélectionner une ville"),
                                  onChanged: (value) {
                                    print(value);
                                  },
                                ),
                                10.py,
                                HMSelect(
                                  value: "",
                                  selectList: villes,
                                  hintText: "Services populaires",
                                  selectionPageTitle:
                                      const Text("Services populaires"),
                                  onChanged: (value) {
                                    print(value);
                                  },
                                ),
                                10.py,
                                HMSelect(
                                  value: "",
                                  selectList: villes,
                                  hintText: "Les plus récents",
                                  selectionPageTitle:
                                      const Text("Les plus récents"),
                                  onChanged: (value) {
                                    print(value);
                                  },
                                ),
                                20.py,
                                const Text(
                                  'Tarifs',
                                  style: TextStyle(
                                      color: titleTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                10.py,
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Minimum"),
                                    Text("Maximum"),
                                  ],
                                ),
                                HMSlider(
                                  value: 2,
                                  color: primaryColor,
                                  onChange: (value) {
                                    print(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
      expandedHeight: getProportionateScreenWidth(120),

      flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1.0,
          background: Column(
            children: [
              getProportionateScreenWidth(60).py,
              const SearchField(
                hintText: 'What services do you need?',
              ),
              // getProportionateScreenWidth(10).py,
            ],
          )),

      // children: [
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         children: [
      //           const CircleAvatar(
      //               backgroundImage: NetworkImage(
      //                   'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg&_gl=1*1r3soyc*_ga*MTg5MjI5ODI0MC4xNjY2NjI4NTU5*_ga_8JE65Q40S6*MTY2NzIzMTMyOC4zLjEuMTY2NzIzMTQzNS4wLjAuMA..'),
      //               radius: 30),
      //           const SizedBox(width: 10),
      //           Column(
      //             // mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               const Text('Hello'),
      //               Text(
      //                 'Matthew Da silva',
      //                 style: Theme.of(context).textTheme.titleMedium,
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //       HMIconButton(
      //           buttonVariant: HMButtonVariant.transparent,
      //           iconColor: Colors.grey,
      //           icon: const Icon(Icons.notification_important_rounded),
      //           onPressed: () {}),
      //     ],
      //   ),
      //   const SizedBox(height: 10),
      //   const HMTextField(
      //     radius: HMRadius.lg,
      //     prefixIcon: Icons.search,
      //     hintText: 'What services do you need?',
      //   ),
      // ],
    );
  }
}
