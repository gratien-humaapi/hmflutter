import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class FilePickerProps extends ActionsPropsBase {
  FilePickerProps({
    bool disabled = false,
    bool hidden = false,
    required this.fileViewInModal,
    required this.isMultipleFiles,
    this.onChange,
  }) : super(disabled, hidden);
  final bool fileViewInModal;
  final bool isMultipleFiles;
  final void Function(List<PlatformFile> files)? onChange;
}
