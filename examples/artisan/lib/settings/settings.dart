import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/settings/edit_profile.dart';
import 'package:artisan/settings/new_password.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import 'personal_infos.dart';
import 'widgets/settings_group.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final notifications = useState(true);
    final emailNotifications = useState(false);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: HMIconButton(
          icon: SvgPicture.asset(
            Assets.icons.arrowLeft,
            width: 25,
          ),
          radius: HMRadius.xl,
          buttonVariant: HMButtonVariant.transparent,
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Paramètres",
          style: TextStyle(
              color: titleTextColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(20)),
        ),
      ),
      body: SafeArea(
        child: ListView(
          // padding:
          //     EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
          children: [
            // General section
            SettingsGroup(
              groupTitle: "General",
              settingsOptions: [
                // Personals Infos
                SettingsOption(
                  title: const Text("Mes informations personnelles"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalInformationsPage(),
                    ),
                  ),
                ),

                // change password
                SettingsOption(
                  title: const Text("Changer de mot de passe"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordPage(),
                    ),
                  ),
                ),

                //  Change the intervention area
                SettingsOption(
                    title: const Text("Changer votre zone d’intervention"),
                    onTap: () {}
                    // () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const EditProfilePage(),
                    //   ),
                    // ),
                    ),

                // change language
                SettingsOption(
                  title: const Text("Changer la langue d'affichage"),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.8,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25)),
                            ),
                            child: ListView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(15),
                                  vertical: getProportionateScreenHeight(20)),
                              children: [
                                ListTile(
                                  dense: true,
                                  // tileColor: Colors.red,
                                  onTap: () {},
                                  leading: const Text(
                                    "🇫🇷",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  title: Text(
                                    "Français",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(16)),
                                  ),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: () {},
                                  leading: const Text(
                                    "🇬🇧",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  title: Text(
                                    "Anglais",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(16)),
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
              ],
            ),
            getProportionateScreenHeight(18).py,

            // Notifiactions
            SettingsGroup(
              groupTitle: "Notifications",
              settingsOptions: [
                SettingsOption(
                  isRoute: false,
                  title: HMSwitch(
                      value: notifications.value,
                      color: primaryColor,
                      label: "Recevoir les notifications",
                      size: HMSwitchSize.md,
                      labelTextStyle: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: titleTextColor),
                      reversed: true,
                      onChange: (bool value) {
                        notifications.value = value;
                      }),
                ),

                // Email notification
                SettingsOption(
                  isRoute: false,
                  title: HMSwitch(
                      value: emailNotifications.value,
                      color: primaryColor,
                      labelTextStyle: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: titleTextColor),
                      label: "Recevoir les notifications par mail",
                      size: HMSwitchSize.md,
                      reversed: true,
                      onChange: (bool value) {
                        emailNotifications.value = value;
                      }),
                ),
              ],
            ),
            getProportionateScreenHeight(18).py,

            // Legal notices and regulations
            SettingsGroup(
              groupTitle: 'Mentions légales et règlements',
              settingsOptions: [
                // Edit profile
                SettingsOption(
                  title: const Text("Conditions de service"),
                  onTap: () {},
                ),

                // change password
                SettingsOption(
                  title: const Text("Politique de confidentialité"),
                  onTap: () {},
                ),

                // change language
                SettingsOption(
                  title: const Text("Politique d’utilisation des cookies"),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
