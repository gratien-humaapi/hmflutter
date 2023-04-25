//
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'utils/reponse_parser.dart';

class HMAuthSDKError implements Exception {
  HMAuthSDKError({required Map errorObj}) {
    message = errorObj['message'];
    statusCode = errorObj['statusCode'];
    name = errorObj['name'];
  }
  String name = '';
  String message = '';
  int statusCode = 0;
}

class HMAuthSDK {
  HMAuthSDK({required String url}) {
    _url = url;
  }

  String _url = "";

  String _accessToken = "";

  String _refreshToken = "";

  String sessionflow = "";

  String sub = "";

  String email = "";

  List<String> groups = [];

  bool admin = false;

  set accessToken(String token) {
    _accessToken = token;
  }

  String get accessToken {
    return _accessToken;
  }

  void _resetValues() {
    _refreshToken = "";
    email = "";
    _accessToken = "";
    admin = false;
    groups = [];
    sessionflow = "";
    sub = "";
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
          'Authorization': withAuthHeader ? 'Bearer $_accessToken' : ''
        },
        body: data,
      );

      if (res.statusCode < 200 || res.statusCode > 299) {
        throw HMAuthSDKError(errorObj: json.decode(res.body));
      }

      if (res.body.isEmpty) {
        return null;
      }
      final resJson = json.decode(res.body);
      // print('The body : $resJson');
      return resJson;
    } catch (error) {
      // print('The error : $error');
      rethrow;
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
    email = payloadMap['email'];
    sub = payloadMap['sub'];
    // print('1 : $payloadMap');
    // groups = List.from(payloadMap["cognito:groups"]);
    // print('2: $groups');
    admin = payloadMap["custom:admin"] == "true";
    // print(payloadMap);
    return payloadMap;
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
      _accessToken = res['authenticationResult']['accessToken'];
      _parseJwt(_accessToken);
      _refreshToken = res['authenticationResult']['refreshToken'];
    }

    return res;
  }

  newPasswordRequired(String username, String newPassword) async {
    if (sessionflow.isEmpty) {
      // print('session is invalid, please sign-in again');
      return;
    }

    final data = {
      'username': username,
      'newPassword': newPassword,
      'session': sessionflow
    };
    final res = await _client(path: "auth/new-password-required", data: data);

    if (res != null &&
        res['authenticationResult'] != null &&
        res['authenticationResult']['refreshToken'] != null) {
      _parseJwt(res['authenticationResult']['accessToken']);
      _refreshToken = res['authenticationResult']['refreshToken'];
    }
    // print('object $res');

    return res;
  }

  forgotPassword(String username) async {
    final data = {'username': username};
    final res = await _client(path: "auth/forgot-password", data: data);
    // print(res);
    return res;
  }

  confirmForgotPassword(
      String username, String confirmationCode, String newPassword) async {
    final res = await _client(
      path: "auth/confirm-forgot-password",
      data: {
        'username': username,
        'confirmationCode': confirmationCode,
        'newPassword': newPassword
      },
    );
    return res;
  }

  signOut() async {
    try {
      _resetValues();
      await _client(path: "auth/sign-out", withAuthHeader: true, data: {});
      return true;
    } catch (err) {
      // print(err);
      throw Exception(err);
    } finally {
      // ignore: control_flow_in_finally
      return true;
    }
  }

  refreshToken() async {
    final body = {'sub': sub, 'refreshToken': _refreshToken};
    try {
      final res = await _client(path: 'token/refresh-tokens', data: body);
      if (res != null) {
        _resetValues();
      }
      _accessToken = res['accessToken'];
      _parseJwt(_accessToken);
      final data = res;
      // print(res);
      return response(data);
      // return res;
    } catch (error) {
      // print(error);
      return errorResponse(error);
    }
  }
}
