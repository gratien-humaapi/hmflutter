import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/homepage/widgets/searchfield.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/constant.dart';
import '../common/widgets/background.dart';
import '../common/widgets/custom_checkbox.dart';

class ProjectDetails extends HookWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3);
    SizeConfig().init(context);
    return Background(
      child: SafeArea(
        minimum:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Row(
              children: [
                HMIconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  fillColor: Colors.white,
                  iconColor: iconColor,
                  onPressed: () {},
                ),
                13.px,
                const Text(
                  "Living room renovation",
                  style: TextStyle(color: labelTextColor, fontSize: 16),
                ),
                const Spacer(),
                HMButton(
                  content: "Select",
                  radius: HMRadius.xl,
                  fillColor: fillColor,
                  textColor: labelTextColor,
                  onPressed: () {},
                ),
                10.px,
                SvgPicture.asset(Assets.icons.filter),
              ],
            ),
            getProportionateScreenHeight(27).py,
            const SearchField(
              radius: HMRadius.xl,
              hintText: 'What services do you need?',
            ),
            getProportionateScreenHeight(22).py,
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF9F9F9),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                  controller: controller,
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return states.contains(MaterialState.focused)
                          ? null
                          : Colors.transparent;
                    },
                  ),
                  dividerColor: Colors.transparent,
                  indicatorWeight: 0.0,
                  indicatorPadding: const EdgeInsets.all(5.0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffA0A0A0).withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(50)),
                  labelColor: const Color(0xffFFAA6C),
                  unselectedLabelColor: labelTextColor,
                  tabs: const [
                    Tab(text: 'Tout'),
                    Tab(text: 'Accepté'),
                    Tab(text: 'Refusé'),
                  ],
                ),
              ),
            ),
            getProportionateScreenHeight(14).py,
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    // physics: const BouncingScrollPhysics(),
                    // controller: InheritedDataProvider.of(context).scrollController,
                    padding: const EdgeInsets.only(top: 8, bottom: 50),
                    itemBuilder: (context, index) {
                      final status = [
                        const Text("En cours",
                            style:
                                TextStyle(color: primaryColor, fontSize: 12)),
                        const Text("Accepté",
                            style: TextStyle(
                                color: Color(0xFF3BE442), fontSize: 12)),
                        const Text("Refusé",
                            style: TextStyle(
                                color: Color(0xFFE93232), fontSize: 12)),
                      ];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 14.0),
                                child: CustomCheckbox(
                                  value: false,
                                  onChange: (value) {},
                                ),
                              ),
                              // 20.px,
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Create on 13/04/22',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: labelTextColor),
                                            ),
                                            Text(
                                              'Fabrication des chaises de tous',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SvgPicture.asset(Assets.icons.more),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Statuts",
                                          style: TextStyle(
                                              color: labelTextColor,
                                              fontSize: 12),
                                        ),
                                        status[index],
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const Center(
                    child: Text('Page 2'),
                  ),
                  const Center(
                    child: Text('Page 3'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
