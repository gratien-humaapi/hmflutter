import 'package:flutter/material.dart';
import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class ImagePickerProps extends ActionsPropsBase {
  ImagePickerProps({
    bool disabled = false,
    bool hidden = false,
    this.isMultipleImage,
    this.hasCancelButton = true,
    this.imageSourceList,
    this.builder,
    this.onChange,
  }) : super(disabled, hidden);
  final bool? isMultipleImage;
  final bool hasCancelButton;
  final List<ActionSheetItem> Function(
      bool isMultipleImage,
      ValueNotifier<List<XFile>> pickedImage,
      void Function() pickMultiImage,
      void Function(ImageSource source) pickSingleImage)? imageSourceList;
  final Widget Function(ValueNotifier<List<XFile>> images, bool isMutipleImage)?
      builder;
  final void Function(List<XFile> images)? onChange;
}
