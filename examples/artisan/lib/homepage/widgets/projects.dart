import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectSession extends HookWidget {
  const ProjectSession({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(28),
              bottom: getProportionateScreenHeight(12),
              top: getProportionateScreenHeight(14)),
          child: Text('Projects',
              style: TextStyle(
                  color: subtitleColor,
                  fontSize: getProportionateScreenHeight(20),
                  fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TabBar(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
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
                labelColor: primaryColor,
                unselectedLabelColor: const Color(0xFF8C8C8C),
                tabs: const [
                  Tab(text: 'Tout'),
                  Tab(text: 'En cours'),
                  Tab(text: 'Terminé'),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          height: MediaQuery.of(context).size.height * 0.85,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              /* For V2 */
              // ListView.builder(
              //   itemCount: 10,
              //   shrinkWrap: true,
              //   // physics: const BouncingScrollPhysics(),
              //   // controller: InheritedDataProvider.of(context).scrollController,
              //   padding: EdgeInsets.only(
              //       top: getProportionateScreenHeight(12),
              //       bottom: getProportionateScreenHeight(20)),
              //   itemBuilder: (context, index) {
              //     return Card(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       elevation: 0.0,
              //       child: Padding(
              //         padding: EdgeInsets.all(getProportionateScreenHeight(6)),
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: <Widget>[
              //             Center(
              //               child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                   child: Image.network(
              //                     'https://images.pexels.com/photos/6256/water-kitchen-black-design.jpg?cs=srgb&dl=pexels-kaboompics-com-6256.jpg&fm=jpg&_gl=1*1agr660*_ga*MTg5MjI5ODI0MC4xNjY2NjI4NTU5*_ga_8JE65Q40S6*MTY2NzIzNjcxNi40LjEuMTY2NzIzNjc2Ni4wLjAuMA..',
              //                     fit: BoxFit.cover,
              //                     height: getProportionateScreenWidth(58),
              //                     width: getProportionateScreenWidth(58),
              //                   )),
              //             ),
              //             getProportionateScreenWidth(11).px,
              //             Expanded(
              //               child: Container(
              //                 padding: const EdgeInsets.only(right: 2.0),
              //                 // width: 200,
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Text(
              //                       'Create on 13/04/22',
              //                       style: TextStyle(
              //                           color: labelTextColor,
              //                           fontSize:
              //                               getProportionateScreenWidth(10)),
              //                     ),
              //                     Text(
              //                       'Electrical installation',
              //                       maxLines: 2,
              //                       overflow: TextOverflow.ellipsis,
              //                       style: TextStyle(
              //                           color: subtitleColor,
              //                           fontSize:
              //                               getProportionateScreenWidth(14),
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     getProportionateScreenHeight(15).py,
              //                     Material(
              //                       elevation: 0.0,
              //                       borderRadius: BorderRadius.circular(6),
              //                       color: index % 2 == 0
              //                           ? const Color(0xffFFA620)
              //                               .withOpacity(0.1)
              //                           : const Color(0xff43E729)
              //                               .withOpacity(0.1),
              //                       child: Padding(
              //                         padding: EdgeInsets.symmetric(
              //                             vertical:
              //                                 getProportionateScreenHeight(4.0),
              //                             horizontal:
              //                                 getProportionateScreenWidth(6.0)),
              //                         child: Text(
              //                           index % 2 == 0
              //                               ? 'In progress'
              //                               : 'Completed',
              //                           style: TextStyle(
              //                               color: index % 2 == 0
              //                                   ? const Color(0xffFFA620)
              //                                   : const Color(0xff43E729),
              //                               fontSize:
              //                                   getProportionateScreenWidth(
              //                                       10)),
              //                         ),
              //                       ),
              //                     )
              //                     // SizedBox(
              //                     //   height: getProportionateScreenHeight(19),
              //                     //   child: Chip(
              //                     //     labelPadding: EdgeInsets.zero,
              //                     // label: Text(
              //                     //     index % 2 == 0
              //                     //         ? 'In progress'
              //                     //         : 'Completed',
              //                     //     style: TextStyle(
              //                     //         color: index % 2 == 0
              //                     //             ? const Color(0xffFFA620)
              //                     //             : const Color(0xff43E729),
              //                     //         fontSize:
              //                     //             getProportionateScreenWidth(
              //                     //                 8))),
              //                     //     visualDensity: VisualDensity.compact,
              //                     //     shape: RoundedRectangleBorder(
              //                     //         borderRadius:
              //                     //             BorderRadius.circular(10)),
              //                     //     elevation: 0,
              //                     //     side: BorderSide.none,
              //                     // backgroundColor: index % 2 == 0
              //                     //     ? const Color(0xffFFA620)
              //                     //         .withOpacity(0.1)
              //                     //     : const Color(0xff43E729)
              //                     //         .withOpacity(0.1),
              //                     //   ),
              //                     // ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsets.only(
              //                   right: getProportionateScreenWidth(23)),
              //               child: const Icon(
              //                 Icons.arrow_forward_ios_rounded,
              //                 size: 20,
              //                 color: Color(0xffB4B4B4),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),

              Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Aucun projet",
                      style: TextStyle(
                          color: titleTextColor,
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Vos projets apparaîtront ici.",
                      style: TextStyle(
                          color: labelTextColor,
                          fontSize: getProportionateScreenWidth(14)),
                    ),
                  ],
                ),
              ),
// page 2
              Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Aucun projet",
                      style: TextStyle(
                          color: titleTextColor,
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Vos projets en cours apparaîtront ici.",
                      style: TextStyle(
                          color: labelTextColor,
                          fontSize: getProportionateScreenWidth(14)),
                    ),
                  ],
                ),
              ),
              // page 3
              Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Aucun projet",
                      style: TextStyle(
                          color: titleTextColor,
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Vos projets terminés apparaîtront ici.",
                      style: TextStyle(
                          color: labelTextColor,
                          fontSize: getProportionateScreenWidth(14)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
