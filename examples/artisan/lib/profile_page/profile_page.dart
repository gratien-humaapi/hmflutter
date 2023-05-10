import 'dart:io';

import 'package:artisan/appshell/appshell_routes.dart';
import 'package:artisan/auth/auth_service.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/portfolio/portfolio.dart';
import 'package:artisan/profile_page/profile_page.routing.dart';
import 'package:artisan/services/service.routing.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:artisan/auth/store/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/image_view.dart';
import '../settings/edit_profile.dart';
import '../subscription/subscription.dart';
import 'widgets/profile_menu.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = useService<AuthService>();
    final UserStore userStore = useService<UserStore>();
    // final User user = userStore.user;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 40,
        leadingWidth: 70,
        forceMaterialTransparency: true,
        leading: HMIconButton(
          icon: SvgPicture.asset(
            Assets.icons.arrowLeft,
            height: 25,
          ),
          radius: HMRadius.xl,
          buttonVariant: HMButtonVariant.transparent,
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Observer(
          builder: (context) => Text(
              "${userStore.user.contact.firstName} ${userStore.user.contact.lastName}",
              style: const TextStyle(fontSize: 18)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: HMIconButton(
              icon: SvgPicture.asset(Assets.icons.edit),
              buttonVariant: HMButtonVariant.transparent,
              onPressed: () {
                /* J'ai utiliser cette option parce que la page n'a pas vraiment
                 une logique en soit c'est juste une page pour envoyzer une info */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.isMobile() ? 20 : 60),
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  getProportionateScreenHeight(50).py,
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(100)),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showActionSheet(
                          context: context,
                          hasCancelButton: false,
                          actions: [
                            if (userStore.user.contact.image != null)
                              ActionSheetItem(
                                title: const Text(
                                  'Voir la photo de profil',
                                  style: TextStyle(
                                      color: titleTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                icon: SizedBox.square(
                                    dimension: 24,
                                    child:
                                        SvgPicture.asset(Assets.icons.profile)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ImageViewPage(
                                          tag: 'profile',
                                          imagePath:
                                              userStore.user.contact.image ??
                                                  "",
                                          imageType: HMImageType.file,
                                        ),
                                      ));
                                },
                              ),
                            ActionSheetItem(
                              onPressed: () async {
                                //
                                final image = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (image != null) {
                                  userStore.addProfileImage(image.path);
                                }
                              },
                              title: const Text(
                                'Sélectionner une photo de profil',
                                style: TextStyle(
                                    color: titleTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              icon: SizedBox.square(
                                dimension: 28,
                                child: SvgPicture.asset(
                                    Assets.icons.uploadPicture),
                              ),
                            ),
                          ],
                        );
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Observer(
                              /* A retoucher à l'implémentation du backend */
                              builder: (context) => Hero(
                                tag: 'profile',
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xFFE9E9E9),
                                  backgroundImage: userStore
                                              .user.contact.image !=
                                          null
                                      ? FileImage(
                                          File(userStore.user.contact.image!))
                                      : null,
                                  child: userStore.user.contact.image == null
                                      ? SvgPicture.asset(Assets.icons.profile)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: const BoxDecoration(
                                  color: primaryColor, shape: BoxShape.circle),
                              child: const Icon(Icons.add_rounded),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  getProportionateScreenHeight(10).py,
                  // User infos
                  Text(
                    '${userStore.user.job.profession.name}',
                    style: TextStyle(
                        color: titleTextColor,
                        fontSize: getProportionateScreenWidth(12)),
                  ),
                  // Text(
                  //   '${userStore.user.bio}',
                  //   style: TextStyle(
                  //       color: subtitleColor,
                  //       fontSize: getProportionateScreenWidth(12)),
                  // ),
                  getProportionateScreenHeight(37).py,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF696969),
                            ),
                          ),
                          Text(
                            "Requests",
                            style: TextStyle(
                              color: Color(0xFFA2A2A2),
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF696969),
                            ),
                          ),
                          Text(
                            "Achievements",
                            style: TextStyle(
                              color: Color(0xFFA2A2A2),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => ServicesPageRoute().push(context),
                        behavior: HitTestBehavior.opaque,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${userStore.userServices.length}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF696969),
                              ),
                            ),
                            const Text(
                              "Services",
                              style: TextStyle(
                                color: Color(0xFFA2A2A2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  getProportionateScreenHeight(32).py,
                  ProfileItem(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SubscriptionPage())),
                    icon: SvgPicture.asset(Assets.icons.crown),
                    title: "Abonnements",
                  ),
                  getProportionateScreenHeight(32).py,

                  ProfileItem(
                    onTap: () => PorfolioPageRoute().go(context),
                    icon: SvgPicture.asset(Assets.icons.portfolio),
                    title: "Portfolio",
                  ),

                  ProfileItem(
                    onTap: () => SettingsPageRoute().push(context),
                    icon: SvgPicture.asset(Assets.icons.settings),
                    title: "Paramètres",
                  ),

                  getProportionateScreenHeight(70).py,
                  const Spacer(),
                  ProfileItem(
                    onTap: () async {
                      print("object");
                      final path = await authService.signOut();
                      print(path);
                      GoRouter.of(context).go(path);
                    },
                    icon: SvgPicture.asset(Assets.icons.logout),
                    title: "Log Out",
                  ),
                  10.py,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
