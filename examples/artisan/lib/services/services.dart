import 'dart:io';

import 'package:artisan/appshell/appshell_routes.dart';
import 'package:artisan/auth/store/user_store.dart';
import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/core/models/user_service/user_service.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/services/service.routing.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import '../common/widgets/background.dart';
import '../common/widgets/custom_appbar.dart';
import '../common/widgets/custom_checkbox.dart';

class ServicesPage extends HookWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = useService<UserStore>();
    final isSelecting = useState(false);
    final selectList = useState(<String>[]);
    SizeConfig().init(context);
    useEffect(() {
      if (selectList.value.isNotEmpty) {
        isSelecting.value = true;
      }
      return null;
    }, [selectList.value]);

    // Add item to selected list
    void _addItem(ValueNotifier<List<String>> selectList, UserService e) {
      final List<String> temp = List.from(selectList.value);
      temp.add(e.id);
      selectList.value = temp;
    }

    // Remove item from selected list
    void _removeItem(ValueNotifier<List<String>> selectList, UserService e) {
      final List<String> temp = List.from(selectList.value);
      temp.removeWhere((element) => element == e.id);
      selectList.value = temp;
    }

    final ScrollController controller =
        InheritedDataProvider.of(context).scrollController;

    return Background(
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Services',
              isSelecting: selectList.value.isNotEmpty || isSelecting.value,
              onDelete: () {
                for (var id in selectList.value) {
                  userStore.removeService(id);
                }
                selectList.value = [];
                isSelecting.value = false;
              },
              selectedItems: selectList.value.length,
              actions: [
                HMButton(
                  content: "Selectionner",
                  size: HMButtonSize.sm,
                  radius: HMRadius.xl,
                  fillColor: fillColor,
                  textColor: labelTextColor,
                  onPressed: () => isSelecting.value = true,
                ),
              ],
              onClose: () {
                print('clear');
                isSelecting.value = false;
                selectList.value = [];
              },
            ),
            //
            getProportionateScreenHeight(20).py,
            Expanded(
              child: Observer(
                builder: (context) => ListView(
                  controller: controller,
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16)),
                  children: List.generate(50, (index) => Text('$index')),
                  //  userStore.userServices
                  //     .map(
                  //       (e) => Container(
                  //         margin: const EdgeInsets.only(bottom: 8),
                  //         child: ListTile(
                  //           contentPadding:
                  //               const EdgeInsets.symmetric(horizontal: 8),
                  //           onTap: () {
                  //             if (isSelecting.value) {
                  //               if (selectList.value.contains(e.id)) {
                  //                 _removeItem(selectList, e);
                  //               } else {
                  //                 _addItem(selectList, e);
                  //               }
                  //             } else {
                  //               UpdateServiceRoute(id: e.id).push(context);
                  //               // context
                  //               //     .goNamed('services', params: {'id': e.id});
                  //             }
                  //           },
                  //           onLongPress: () {
                  //             if (!isSelecting.value) {
                  //               _addItem(selectList, e);
                  //             }
                  //           },
                  //           leading: SizedBox.square(
                  //             dimension: 58,
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(15),
                  //               child: e.serviceImage == null
                  //                   ? SvgPicture.asset(Assets.icons.placeholder)
                  //                   : Image.file(
                  //                       File(e.serviceImage!),
                  //                       errorBuilder:
                  //                           (context, error, stackTrace) =>
                  //                               SvgPicture.asset(
                  //                                   Assets.icons.placeholder),
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //             ),
                  //           ),
                  //           title: Text(
                  //             e.name,
                  //             overflow: TextOverflow.ellipsis,
                  //             maxLines: 2,
                  //             style: TextStyle(
                  //               fontSize: getProportionateScreenWidth(14),
                  //               fontWeight: FontWeight.w500,
                  //               color: titleTextColor,
                  //             ),
                  //           ),
                  //           trailing: isSelecting.value
                  //               ? CustomCheckbox(
                  //                   color: primaryColor,
                  //                   value: selectList.value.contains(e.id),
                  //                   onChange: (bool value) {
                  //                     if (value) {
                  //                       _addItem(selectList, e);
                  //                     } else {
                  //                       _removeItem(selectList, e);
                  //                     }
                  //                   },
                  //                 )
                  //               : Padding(
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: InkWell(
                  //                     onTap: () {
                  //                       showActionSheet(
                  //                         context: context,
                  //                         hasCancelButton: false,
                  //                         actions: [
                  //                           ActionSheetItem(
                  //                             icon: SvgPicture.asset(
                  //                                 Assets.icons.edit),
                  //                             title: const Row(
                  //                               children: [
                  //                                 Text(
                  //                                   'Editer le service',
                  //                                   style: TextStyle(
                  //                                       color: titleTextColor,
                  //                                       fontSize: 14,
                  //                                       fontWeight:
                  //                                           FontWeight.w500),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             onPressed: () {
                  //                               UpdateServiceRoute(id: e.id)
                  //                                   .push(context);
                  //                               // context.goNamed('services',
                  //                               //     params: {'id': e.id});
                  //                             },
                  //                           ),
                  //                           ActionSheetItem(
                  //                             icon: SvgPicture.asset(
                  //                                 Assets.icons.trash),
                  //                             title: const Row(
                  //                               children: [
                  //                                 Text(
                  //                                   'Supprimer le service',
                  //                                   style: TextStyle(
                  //                                       color: titleTextColor,
                  //                                       fontSize: 14,
                  //                                       fontWeight:
                  //                                           FontWeight.w500),
                  //                                 )
                  //                               ],
                  //                             ),
                  //                             onPressed: () =>
                  //                                 userStore.removeService(e.id),
                  //                           ),
                  //                         ],
                  //                       );
                  //                     },
                  //                     child:
                  //                         SvgPicture.asset(Assets.icons.more),
                  //                   ),
                  //                 ),
                  //         ),
                  //       ),
                  //     )
                  //     .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
