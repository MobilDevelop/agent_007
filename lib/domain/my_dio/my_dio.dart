import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_interceptor.dart';
import 'package:dio/dio.dart';

class MyDio {
  final Dio _dio = Dio();
  MyDio() {
    _dio.interceptors.add(
        MyInterceptor(baseUrl: Constants.baseUrl));
  }
  Dio dio() {
    return _dio;
  }
}