import 'package:artisan/injection.dart';

T useService<T extends Object>() {
  return getIt.get<T>();
}
