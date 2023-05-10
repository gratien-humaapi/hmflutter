import 'dart:io';

import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import 'custom_painter.dart';

Widget imagePickerBuilder(
    ValueNotifier<List<XFile>> images, bool isMultipleSelection) {
  return Container(
    height: getProportionateScreenHeight(300),
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
                    border: Border.all(color: const Color(0xFF969696)),
                    borderRadius: BorderRadius.circular(16)),
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
}


/* Image builder for multiple images picker */
// Widget imagePickerBuilder(
//     ValueNotifier<List<XFile>> images, bool isMultipleSelection) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
//     height: getProportionateScreenHeight(200),
//     decoration: BoxDecoration(
//       color: fillColor,
//       borderRadius: BorderRadius.circular(27),
//     ),
//     child: Stack(
//       alignment: Alignment.center,
//       children: [
//         const Positioned(
//           top: 0,
//           left: 0,
//           child: Text(
//             "Ajouter vos réalisations (max 15mo)",
//             style: TextStyle(color: labelTextColor),
//           ),
//         ),
//         if (images.value.isEmpty)
//           Center(
//             child: SvgPicture.asset("assets/icons/upload-picture.svg"),
//           )
//         else
//           Padding(
//             padding: EdgeInsets.only(top: getProportionateScreenHeight(25)),
//             child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) =>
//                   Row(
//                 children: List.generate(
//                     images.value.length <= 2 ? images.value.length : 3,
//                     (index) {
//                   if (index < 2) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 14.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: SizedBox(
//                           height: 65,
//                           width: 65,
//                           child: Image.file(
//                             File(images.value[index].path),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 14.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: SizedBox(
//                           height: 65,
//                           width: 65,
//                           child: Stack(
//                             fit: StackFit.expand,
//                             children: [
//                               Image.file(
//                                 File(images.value[index].path),
//                                 fit: BoxFit.cover,
//                               ),
//                               if (images.value.length != 3)
//                                 Container(
//                                     color: Colors.black.withOpacity(0.5),
//                                     child: Center(
//                                       child: Text(
//                                         '+${images.value.length - 3}',
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 })
//                   ..add(Container(
//                     height: 65,
//                     width: 65,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         border: Border.all(color: labelTextColor)),
//                     child: const Center(
//                       child: Icon(Icons.add_rounded),
//                     ),
//                   )),
//               ),
//             ),
//           )
//       ],
//     ),
//   );
// }
