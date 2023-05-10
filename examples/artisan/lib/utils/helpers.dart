//

import 'package:hmreactive_widget/hmreactive_widget.dart';

checkValidFormControls(FormGroup form, dynamic inputKey) {
  if (inputKey is String) {
    print('String');
    return form.control(inputKey).valid;
  }

  if (inputKey is List) {
    return inputKey.every((element) => form.control(element).valid);
  }

  return false;
}
