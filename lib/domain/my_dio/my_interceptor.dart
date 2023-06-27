// ignore_for_file: deprecated_member_use

import 'package:agent_007/infrasutruktura/local_source/local_source.dart';
import 'package:dio/dio.dart';

class MyInterceptor extends Interceptor  {
  // final String token;
  final String baseUrl;
  MyInterceptor({ required this.baseUrl});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler){
      print(err.response); 
    if (err.response?.statusCode == 401) {
      //Navigator.pop(context);
        // Navigator.of(context)
        //   .pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await LocalSource.getInfo("token");
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Content-Type'] = 'application/json';

    options.baseUrl = baseUrl;
    super.onRequest(options, handler);
  }
}

