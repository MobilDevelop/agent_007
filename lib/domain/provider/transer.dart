import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:dio/dio.dart';

class TransferService {
  final Dio dio = MyDio().dio();
}
