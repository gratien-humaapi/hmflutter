import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../common/widgets/custom_appbar.dart';
import '../common/widgets/image_view.dart';

class Portfolio extends HookWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelecting = useState(false);
    final selectList = useState(<String>[]);
    useEffect(() {
      if (selectList.value.isNotEmpty) {
        isSelecting.value = true;
      }
      return null;
    }, [selectList.value]);

    // Add item to selected list
    void _addItem(ValueNotifier<List<String>> selectList, String image) {
      final List<String> temp = List.from(selectList.value);
      temp.add(image);
      selectList.value = temp;
    }

    // Remove item from selected list
    void _removeItem(ValueNotifier<List<String>> selectList, String image) {
      final List<String> temp = List.from(selectList.value);
      temp.removeWhere((element) => element == image);
      selectList.value = temp;
    }

    // To be removed
    final List<String> imagesList = [
      "https://images.pexels.com/photos/4273433/pexels-photo-4273433.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/116910/pexels-photo-116910.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/2762247/pexels-photo-2762247.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/2082090/pexels-photo-2082090.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/3705539/pexels-photo-3705539.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ];

    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              hasBackButton: true,
              title: 'Porfolio',
              isSelecting: selectList.value.isNotEmpty || isSelecting.value,
              onDelete: () {
                // for (var id in selectList.value) {
                //   userStore.removeService(id);
                // }
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
                HMIconButton(
                  icon: SvgPicture.asset(
                    Assets.icons.addCircle,
                  ),
                  buttonVariant: HMButtonVariant.transparent,
                  onPressed: () {
                    // TODO : Fonction pour rajouter des images
                  },
                )
              ],
              onClose: () {
                print('clear');
                isSelecting.value = false;
                selectList.value = [];
              },
            ),

            //
            // getProportionateScreenHeight(30).py,
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(20)),
                itemCount: imagesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: SizeConfig.isMobile() ? 2 : 3),
                itemBuilder: (context, index) {
                  final image = imagesList[index];
                  return GestureDetector(
                    onTap: () {
                      if (isSelecting.value) {
                        if (selectList.value.contains(image)) {
                          _removeItem(selectList, image);
                        } else {
                          _addItem(selectList, image);
                        }
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageViewPage(
                              tag: index,
                              imagePath: imagesList[index],
                              imageType: HMImageType.network,
                            ),
                          ),
                        );
                      }
                    },
                    onLongPress: () {
                      if (!isSelecting.value) {
                        _addItem(selectList, image);
                      }
                    },
                    child: Hero(
                      tag: index,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: SizedBox(
                          height: getProportionateScreenHeight(170),
                          width: getProportionateScreenWidth(160),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // const Center(child: CircularProgressIndicator()),
                              // FadeInImage.memoryNetwork(
                              //   placeholder: kTransparentImage,
                              //   image: 'https://picsum.photos/250?image=9',
                              // ),
                              Image.network(
                                imagesList[index],
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                              if (selectList.value.contains(image))
                                const Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: primaryColor,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
