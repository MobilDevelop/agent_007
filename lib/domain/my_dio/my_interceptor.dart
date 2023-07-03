// ignore_for_file: deprecated_member_use

import 'package:agent_007/infrasutruktura/local_source/local_source.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyInterceptor extends Interceptor {
  // final String token;
  final String baseUrl;
  MyInterceptor({required this.baseUrl});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.response);
    EasyLoading.showError(
        "message: ${err.response?.statusMessage ?? ''},  status code:${err.response?.statusCode}");
    if (err.response?.statusCode == 401) {
      EasyLoading.showInfo(tr('universal.error'));
      LocalSource.clearProfile();
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await LocalSource.getInfo("token");
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Content-Type'] = 'application/json';

    options.baseUrl = baseUrl;
    super.onRequest(options, handler);
  }
}
