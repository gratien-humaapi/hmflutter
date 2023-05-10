import 'package:artisan/auth/store/user_store.dart';
import 'package:artisan/core/sdk/hm_auth_sdk.dart';
import 'package:injectable/injectable.dart';

import '../core/sdk/utils/reponse_parser.dart';

// @module
// abstract class RegisterModule {
//   @preResolve
//   Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

//   // @lazySingleton
//   // AuthService get authService => AuthService(prefs);
// }

@Singleton()
class AuthService {
  final HMAuthSDK _authSDK = HMAuthSDK(
      url: "http://10.0.2.2:3000"); //"http://192.168.100.172:3000" 10.0.2.2
  UserStore userStore;
  AuthService(this.userStore);

  // It represent an email
  String _tempUsername = "";

  bool isTokenRefreshing = false;

  getUserInfo() async {
    // final roles: string[] = this._authSDK.groups;
    final String email = _authSDK.email;
    final String sub = _authSDK.sub;
    final data = {
      'attributes': {email, sub}
    };
    return response(data);
  }

  get accessToken {
    final accessToken = _authSDK.accessToken;
    return accessToken;
  }

  refreshToken() async {
    // if (!isTokenRefreshing) {
    print("refreshing ...");
    isTokenRefreshing = true;
    final res = await _authSDK.refreshToken();
    print("finish");
    isTokenRefreshing = false;
    if (!isResolved(res)) {
      final error = res;
      print('error $error');
      // this._loggerService.notify(<any>error, "error");
    }
    // }
  }

  Future<String> signUp(Map<String, dynamic> params) async {
    try {
      print(params);
      // final link = Uri.parse("${_url}auth/signup");
      final res = await _authSDK.signUp(params);
      print("$res");
      if (res == null) {
        return "";
      }
      _tempUsername = params["username"];
      print(_tempUsername);
      return "confirm-sign-up";
    } catch (e) {
      //
      rethrow;
    }
  }

  Future<String> confirmSignUp(Map<String, dynamic> params) async {
    try {
      print(_tempUsername);
      final data = {"username": _tempUsername, ...params};
      print(data);
      final res = await _authSDK.confirmSignUp(data);
      // print("$res");
      return "/more-info";
    } catch (e) {
      //
      rethrow;
    }
  }

  Future<String> signIn(Map<String, dynamic> signInData) async {
    try {
      print(signInData);
      final res = await _authSDK.signIn(signInData);
      _tempUsername = signInData['username'];
      print(res);
      return "/";
    } on HMAuthSDKError catch (e) {
      print(e);
      if (e.message == "User is not confirmed.") {
        _tempUsername = signInData['username'];
        return "/auth/confirm-sign-up";
      }
      rethrow;
      //
    }
  }

  Future<String> signOut() async {
    try {
      final res = await _authSDK.signOut();
      return '/auth';
    } on HMAuthSDKError {
      return '/auth';
      // throw e;
      //
    }
  }

  Future<String> forgotPassword(Map<String, dynamic> data) async {
    try {
      // print(data);
      final Map<String, dynamic>? res = await _authSDK.forgotPassword(data);
      _tempUsername = data['username'];

      if (res == null || !res.containsKey("Destination")) {
        return "";
      }
      // print(res);
      return "verification-code";
    } catch (e) {
      rethrow;
      //
    }
  }

  Future<bool> resendForgotPasswordCode() async {
    try {
      // print(data);
      final Map<String, dynamic>? res =
          await _authSDK.forgotPassword({'username': _tempUsername});
      if (res == null || !res.containsKey("Destination")) {
        return false;
      }
      return true;
    } catch (e) {
      rethrow;
      //
    }
  }

  Future<bool> resendConfirmationCode() async {
    try {
      print(_tempUsername);
      final Map<String, dynamic>? res =
          await _authSDK.resendConfirmationCode({"username": _tempUsername});

      if (res == null || !res.containsKey("Destination")) {
        return false;
      }
      return true;
      // print(res);
    } catch (e) {
      rethrow;
      //
    }
  }

  Future<String> confirmForgotPassword(Map<String, dynamic> params) async {
    try {
      final Map<String, dynamic> a = Map.from(params)
        ..remove("confirmPassword");
      // print(a);
      final data = {"username": _tempUsername, ...a};
      print(data);
      final res = await _authSDK.confirmForgotPassword(data);
      // print("$res");
      return "/auth";
    } catch (e) {
      //
      rethrow;
    }
  }

  Future<bool> changePassword(Map<String, dynamic> params) async {
    try {
      final Map<String, dynamic> data = Map.from(params)
        ..remove("confirmPassword");

      print(data);
      final res = await _authSDK.changePassword(data);
      // print("$res");
      return res['done'];
    } catch (e) {
      //
      rethrow;
    }
  }
}
