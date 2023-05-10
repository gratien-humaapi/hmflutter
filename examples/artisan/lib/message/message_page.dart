import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/custom_appbar.dart';

class MessagePage extends HookWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelecting = useState(false);
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: 'Contacts',
            isSelecting: isSelecting.value,
            onClose: () {
              isSelecting.value = !isSelecting.value;
            },
            actions: <Widget>[
              HMButton(
                content: "Sélectionner",
                radius: HMRadius.xl,
                fillColor: fillColor,
                size: HMButtonSize.sm,
                textColor: labelTextColor,
                // buttonVariant: HMButtonVariant.transparent,
                onPressed: () {
                  isSelecting.value = !isSelecting.value;
                },
              ),
            ],
            onDelete: () {},
            selectedItems: 0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Aucun message",
                  style: TextStyle(
                      color: titleTextColor,
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Les messages envoyés et reçus apparaîtront ici",
                  style: TextStyle(
                      color: labelTextColor,
                      fontSize: getProportionateScreenWidth(14)),
                )
              ],
            ),
          ),
        ],
      ),

      /* For V2 */
      // Column(
      //   children: [
      //     Row(
      //       children: [
      //         HMIconButton(
      //           icon: const Icon(
      //             Icons.arrow_back_ios_rounded,
      //           ),
      //           fillColor: Colors.white,
      //           iconColor: iconColor,
      //           onPressed: () {},
      //         ),
      //         const Expanded(
      //           child: Center(
      //             child: Text(
      //               "Messages",
      //               style: TextStyle(
      //                   // color: labelTextColor,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     //
      //     getProportionateScreenHeight(30).py,
      //     Expanded(
      //       child: ListView(
      //         // itemExtent: 20,
      //         children: [
      //           const ChatTile(
      //             username: "Robert MAGUNO",
      //             message: "Bonjour Mr",
      //             avatar:
      //                 "https://images.pexels.com/photos/9222625/pexels-photo-9222625.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //           ),
      //           const ChatTile(
      //             username: "Robert MAGUNO",
      //             message:
      //                 "Vous : Vous pouvez venir vers la zone de cadjehou à 15h",
      //             avatar:
      //                 "https://images.pexels.com/photos/3817500/pexels-photo-3817500.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //           ),
      //           const ChatTile(
      //             username: "Robert MAGUNO",
      //             message:
      //                 "Vous : Vous pouvez venir vers la zone de cadjehou à 15h",
      //             avatar:
      //                 "https://images.pexels.com/photos/3817500/pexels-photo-3817500.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}


// class ChatTile extends StatelessWidget {
//   const ChatTile({
//     super.key,
//     required this.username,
//     required this.message,
//     required this.avatar,
//   });

//   final String username;
//   final String message;
//   final String avatar;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ChatScreen(),
//           )),
//       child: Container(
//           // height: getProportionateScreenHeight(60),
//           // color: Colors.red.withOpacity(0.1),
//           child: ListTile(
//         dense: true,
//         leading: SizedBox(
//           height: getProportionateScreenHeight(60),
//           width: getProportionateScreenHeight(60),
//           child: CircleAvatar(
//             backgroundImage: NetworkImage(avatar),
//           ),
//         ),
//         title: Text(
//           username,
//           style: TextStyle(
//             // color: labelTextColor,
//             fontWeight: FontWeight.bold,
//             fontSize: getProportionateScreenWidth(14),
//           ),
//         ),
//         subtitle: Text(
//           message,
//           // maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//             color: labelTextColor,
//             fontSize: getProportionateScreenWidth(12),
//           ),
//         ),
//       )
//           // Row(
//           //   crossAxisAlignment: CrossAxisAlignment.center,
//           //   children: [
//           // SizedBox(
//           //   height: getProportionateScreenHeight(60),
//           //   width: getProportionateScreenHeight(60),
//           //   child: CircleAvatar(
//           //     backgroundImage: NetworkImage(avatar),
//           //   ),
//           // ),
//           //     getProportionateScreenWidth(20).px,
//           //     Expanded(
//           //       child: Column(
//           //         crossAxisAlignment: CrossAxisAlignment.start,
//           //         children: [
//           // Text(
//           //   username,
//           //   style: TextStyle(
//           //       // color: labelTextColor,
//           //       fontWeight: FontWeight.bold,
//           //       fontSize: getProportionateScreenWidth(14)),
//           // ),
//           // Text(
//           //   message,
//           //   // maxLines: 1,
//           //   overflow: TextOverflow.ellipsis,
//           //   style: TextStyle(
//           //       color: labelTextColor,
//           //       fontSize: getProportionateScreenWidth(12)),
//           // ),
//           //         ],
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           ),
//     );
//   }
// }
