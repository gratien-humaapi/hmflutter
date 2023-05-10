// import 'package:artisan/auth/auth_service.dart';
// import 'package:artisan/core/useservice.dart';
// import 'package:injectable/injectable.dart';
// import 'package:mobx/mobx.dart';

// @Singleton()
// class AuthStore = _AuthStore with _$AuthStore;

// abstract class _AuthStore with Store {
//   final AuthService _authService = useService<AuthService>();
//   @action
//   Future<void> signUp(Map<String, dynamic> signUpData) async {
//     final Map<String, dynamic> data = Map.from(signUpData)
//       ..remove("confirmPassword");
//     try {
//       final String res = await _authService.signUp(data);
//       if (res.isNotEmpty) {
//         Gor
//       }
//     } catch (e) {
//       //
//     }
//   }
// }
