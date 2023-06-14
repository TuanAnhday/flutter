import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/default.i18n.dart';

import '../app/app.module.dart';
import '../config/application.dart';

class API {
  API() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    // dio.interceptors
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (Application.sharePreference.hasKey('accessToken')) {
            options.headers['Authorization'] =
                "Bearer ${Application.sharePreference.getString("accessToken")}";
          }
          debugPrint('${options.uri}');
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          return handler.next(response); // continue
        },
        onError: (e, handler) async {
          _handleTimeOutException(e.type);
          if (e.response?.statusCode == 401 &&
              e.response?.data['message'] !=
                  'Tài khoản hoặc mật khẩu không chính xác' &&
              e.response?.data['message'] !=
                  'Tài khoản của bạn đã bị khóa. Vui lòng liên hệ với bộ phận hỗ trợ để có thêm thông tin.') {
            if (await refreshToken()) {
              final opts = Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers);
              final cloneReq = await dio.request(e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters);
              return handler.resolve(cloneReq);
            } else {
              // await asuka.showDialog(
              //   builder: (context) => TimeoutDialog(
              //     title: e.response?.data['message'].toString() ?? 'Your login session has expired. Please login again'.i18n,
              //   ),
              // );
              if (Application.sharePreference.hasKey('deviceToken')) {
                // NotificationRepository.deleteDeviceToken({
                //   'token': Application.sharePreference.getString('deviceToken').toString(),
                //   'userId': Application.sharePreference.getString('userId')
                // });
              }
              // await SignalRManager.stopSignalR();
              await Application.sharePreference
                  .clearAllExcept(['credentialData', 'listUser']);
              Modular.to.navigate(AppModule.splashScreen);
            }
          }
          if (e.response?.statusCode == 401 &&
              e.response?.data['message'] ==
                  'Tài khoản của bạn đã bị khóa. Vui lòng liên hệ với bộ phận hỗ trợ để có thêm thông tin.') {
            // await asuka.showDialog(
            //   builder: (context) => TimeoutDialog(
            //     title: e.response?.data['message'].toString() ?? 'Your login session has expired. Please login again'.i18n,
            //   ),
            // );
          }
          if (e.response?.statusCode == 409) {
            checkLoginOtherDevice++;
          }
          if (checkLoginOtherDevice == 1) {
            loginOtherDevice();
          }
          final response =
              e.response ?? Response(requestOptions: e.requestOptions);
          return handler.resolve(response); //continue
        },
      ),
    );
  }

  // static String baseUrl = 'https://192.168.0.106:44333/';
  static String baseUrl = 'https://test.aitalk.vn/';
  // static String baseUrl = 'https://127.0.0.1:44333/';
  // static String baseUrl = 'https://jsonplaceholder.typicode.com/';

  // static String cloudStorageUrl = 'https://storage.googleapis.com';
  // static String cloudStorageBucket = 'hoclieu';
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      sendTimeout: 60000,
      receiveTimeout: 30000,
      contentType: 'application/json; charset=utf-8',
      baseUrl: baseUrl,
    ),
  );
  var dioToken = Dio();
  int checkLoginOtherDevice = 0;

  var time = 1;
  bool checkRefresh = false;
  String currentToken = '';

  Future<bool> refreshToken() async {
    try {
      await Future.delayed(Duration(seconds: time++), () async {
        if (!checkRefresh) {
          checkRefresh = true;
          currentToken = Application.sharePreference.getString('authToken')!;
          final Map<String, dynamic> data = {
            'token': Application.sharePreference.getString('refreshToken')
          };
          final response = await dio.post('/api/Auth/RefreshToken', data: data);
          if (response.statusCode == HttpStatus.ok) {
            final newAccessToken = response
                .data['accessToken']; // get new access token from response
            final newRefreshToken = response
                .data['refreshToken']; // get new refresh token from response
            Application.sharePreference
              ..putString('authToken', '$newAccessToken')
              ..putString('refreshToken', '$newRefreshToken');
            Future.delayed(const Duration(seconds: 2), () {
              currentToken =
                  Application.sharePreference.getString('authToken')!;
              checkRefresh = false;
              time = 1;
            });
            return true;
          } else {
            checkRefresh = false;
            time = 1;
            return false;
          }
        } else {
          if (Application.sharePreference.getString('authToken') !=
              currentToken) {
            return true;
          } else {
            return false;
          }
        }
      });
      if (Application.sharePreference.getString('authToken') != currentToken) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future loginOtherDevice() async {
    // await asuka.showDialog(builder: (context) => TimeoutDialog(title: 'Your account is logged in on another device'.i18n));
    if (Application.sharePreference.hasKey('deviceToken')) {
      // NotificationRepository.deleteDeviceToken(
      //     {'token': Application.sharePreference.getString('deviceToken').toString(), 'userId': Application.sharePreference.getString('userId')});
    }
    // await SignalRManager.stopSignalR();
    await Application.sharePreference
        .clearAllExcept(['credentialData', 'listUser']);
    Modular.to.navigate(AppModule.splashScreen);
    checkLoginOtherDevice = 0;
  }

  void _handleTimeOutException(DioErrorType type) {
    switch (type) {
      case DioErrorType.connectTimeout:
        Application.toast.showToastFailed('Failed connect to server');
        break;
      case DioErrorType.sendTimeout:
        Application.toast.showToastFailed('Failed sending data to server');
        break;
      case DioErrorType.receiveTimeout:
        Application.toast.showToastFailed('Failed receiving data from server');
        break;
      case DioErrorType.other:
        Application.toast.showToastFailed('Unknown Error'.i18n);
        Application.sharePreference
            .clearAllExcept(['credentialData', 'listUser']);
        Modular.to.navigate(AppModule.splashScreen);
        break;
      default:
        break;
    }
  }

  Future<Response> get(String url, [Map<String, dynamic>? params]) async {
    return dio.get(url, queryParameters: params);
  }

  Future<Response> post(String url, dynamic params,
      [Map<String, dynamic>? queries]) async {
    return dio.post(url, data: params, queryParameters: queries);
  }

  Future<Response> put(String url, [dynamic params]) async {
    return dio.put(url, data: params);
  }

  Future<Response> delete(String url, [Map<String, dynamic>? params]) async {
    return dio.delete(url, queryParameters: params);
  }
}
