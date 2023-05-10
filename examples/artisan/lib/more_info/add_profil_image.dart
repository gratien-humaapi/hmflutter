import 'dart:io';

import 'package:artisan/common/constant.dart';
import 'package:artisan/common/custom_painter.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/more_info/more_info.routing.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../auth/store/user_store.dart';
import '../core/useservice.dart';

class AddProfileImage extends HookWidget {
  const AddProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = useState('');
    SizeConfig().init(context);
    final UserStore userStore = useService<UserStore>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(28),
              right: getProportionateScreenWidth(28),
              top: getProportionateScreenHeight(48)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Ajouter une photo de profil",
                    style: TextStyle(
                        color: titleTextColor,
                        fontSize: getProportionateScreenWidth(26),
                        fontWeight: FontWeight.bold),
                  ),
                  getProportionateScreenHeight(12).py,
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(
                        color: labelTextColor,
                        fontSize: getProportionateScreenWidth(12)),
                  ),
                  getProportionateScreenHeight(45).py,
                  HMImagePicker(
                    // hasCancelButton: false,
                    builder: (images, isMutipleImage) {
                      return Container(
                        // padding: const EdgeInsets.symmetric(
                        //     vertical: 14, horizontal: 20),
                        height: getProportionateScreenHeight(300),
                        // width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(27),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            if (images.value.isEmpty)
                              CustomPaint(
                                painter: DashedPainter(27),
                                child: Center(
                                  child: Container(
                                    height: getProportionateScreenHeight(80),
                                    width: getProportionateScreenHeight(80),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFAFAFA),
                                        border: Border.all(
                                            color: const Color(0xFF969696)),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add_rounded,
                                        color: Color(0xFF969696),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  File(images.value.first.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                          ],
                        ),
                      );
                    },
                    onImageSelected: (value) {
                      print(value);
                      imagePath.value = value.first.path;
                    },
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: HMButton(
                          content: "Plus tard",
                          radius: HMRadius.xl,
                          borderColor: const Color(0xFFF3F3F3),
                          textColor: primaryColor, // Colors.white,
                          buttonVariant: HMButtonVariant.outlined,
                          fontWeight: FontWeight.w500,
                          size: HMButtonSize.lg,
                          onPressed: () {
                            WelcomeRoute().pushReplacement(context);
                          }),
                    ),
                    10.px,
                    Expanded(
                      child: HMButton(
                          content: "Ok",
                          fontWeight: FontWeight.w500,
                          size: HMButtonSize.lg,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.0, 1.0),
                              color: primaryColor.withOpacity(0.6),
                              spreadRadius: 0,
                              blurRadius: 18,
                            ),
                          ],
                          radius: HMRadius.xl,
                          textColor: Colors.white,
                          onPressed: () {
                            userStore.addProfileImage(imagePath.value);
                            WelcomeRoute().pushReplacement(context);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
