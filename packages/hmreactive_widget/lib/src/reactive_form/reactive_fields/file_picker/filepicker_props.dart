import 'package:hmwidget/hmwidget.dart';

import '../../props_base.dart';

class FilePickerProps extends PropsBase {
  FilePickerProps({
    super.disabled,
    super.hidden,
    required this.fileViewInModal,
    required this.isMultipleFiles,
    this.onChange,
  });
  final bool fileViewInModal;
  final bool isMultipleFiles;
  final void Function(List<PlatformFile> files)? onChange;
}
