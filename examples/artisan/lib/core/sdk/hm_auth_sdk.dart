//
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/reponse_parser.dart';

class HMAuthSDKError implements Exception {
  HMAuthSDKError({required Map errorObj}) {
    message = errorObj['message'];
    statusCode = errorObj['statusCode'];
    name = errorObj['error'];
  }
  String? name;
  String message = '';
  int statusCode = 0;
}

class HMAuthSDK {
  HMAuthSDK({required String url}) {
    _url = url;
  }

  String _url = "";

  String accessToken = "";

  String idToken = "";

  String _refreshToken = "";

  String sessionflow = "";

  String sub = "";

  String email = "";

  List<String> groups = [];

  bool admin = false;

  setRefreshToken(String token) async {
    _refreshToken = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('refreshToken', token);
  }

  getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _refreshToken = prefs.getString('refreshToken') ?? '';
  }

  setSub(String sub) async {
    sub = sub;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sub', sub);
  }

  getSub() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sub = prefs.getString('sub') ?? '';
  }

  void _resetValues() {
    setRefreshToken('');
    email = "";
    accessToken = "";
    idToken = "";
    admin = false;
    groups = [];
    sessionflow = "";
    setSub('');
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;

      default:
        throw Exception('Illegal base64url string!');
    }
    return utf8.decode(base64Url.decode(output));
  }

  _client({
    required String path,
    bool withAuthHeader = false,
    required Map data,
  }) async {
    //
    try {
      final res = await http.post(
        Uri.parse('$_url/$path'),
        headers: {
          // HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8",
          'Authorization': withAuthHeader ? 'Bearer $accessToken' : ''
        },
        body: data,
      );
      print("ici ${res.body}");

      if (res.statusCode < 200 || res.statusCode > 299) {
        print("show error");
        throw HMAuthSDKError(errorObj: json.decode(res.body));
      }
      if (res.body.isEmpty) {
        print("empty");
        return null;
      }
      final resJson = json.decode(res.body);
      return resJson;
    } catch (error) {
      print('here error $error');
      if (error is HMAuthSDKError) {
        rethrow;
      }

      throw HMAuthSDKError(errorObj: {
        'statusCode': 408,
        'message': "Network error, please try again."
      });
      // return error;
    }
  }

  Map<String, dynamic> _parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }
    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid patload');
    }
    // print(payloadMap);
    email = payloadMap['email'];
    sub = payloadMap['sub'];
    // print('1 : $payloadMap');
    // groups = List.from(payloadMap["cognito:groups"]);
    // print('2: $groups');
    admin = payloadMap["custom:admin"] == "true";
    // print(payloadMap);
    return payloadMap;
  }

// Sign Up method
  signUp(Map data) async {
    final res = await _client(path: 'auth/sign-up', data: data);
    return res;
  }

  confirmSignUp(Map<String, dynamic> data) async {
    final res = await _client(path: "auth/confirm-sign-up", data: data);
    return res;
  }

// Sign In method
  signIn(Map data) async {
    final res = await _client(path: 'auth/sign-in', data: data);

    if (res != null && res['session'] != null) {
      _resetValues();
      sessionflow = res['session'];
      // print(sessionflow);
    }

    if (res != null &&
        res['authenticationResult'] != null &&
        res['authenticationResult']['accessToken'] != null) {
      //
      accessToken = res['authenticationResult']['accessToken'];
      idToken = res['authenticationResult']['idToken'];
      _parseJwt(idToken);
      setSub(sub);
      setRefreshToken(res['authenticationResult']['refreshToken']);
    }

    return res;
  }

  forgotPassword(Map<String, dynamic> data) async {
    final res = await _client(path: "auth/forgot-password", data: data);
    // print(res);
    return res;
  }

  resendConfirmationCode(Map<String, dynamic> data) async {
    final res =
        await _client(path: "auth/resend-confirmation-code", data: data);
    // print(res);
    return res;
  }

  changePassword(Map<String, dynamic> data) async {
    final res = await _client(
        path: "auth/change-password",
        data: {"accessToken": accessToken, ...data});
    return res;
  }

  confirmForgotPassword(Map<String, dynamic> data) async {
    final res = await _client(path: "auth/confirm-forgot-password", data: data);
    return res;
  }

  Future<bool> signOut() async {
    try {
      await _client(
          path: "token/revoke",
          withAuthHeader: true,
          data: {'refreshToken': _refreshToken});
      _resetValues();
      return true;
    } catch (err) {
      // print(err);
      rethrow;
    } finally {
      // ignore: control_flow_in_finally
      return true;
    }
  }

  refreshToken() async {
    await getRefreshToken();
    await getSub();
    final body = {'sub': sub, 'refreshToken': _refreshToken};
    print(body);
    try {
      _resetValues();
      final res = await _client(path: 'token/refresh-tokens', data: body);
      print('res $res');
      if (res != null) {
        accessToken = res['accessToken'];
        _parseJwt(accessToken);
        final data = res;
        print(res);
        return response(data);
      }

      return {};
    } catch (error) {
      print(error);
      return errorResponse(error);
    }
  }
}
