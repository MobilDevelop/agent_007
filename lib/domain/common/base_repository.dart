// ignore_for_file: deprecated_member_use

import 'package:agent_007/domain/failur/failure.dart';
import 'package:agent_007/domain/failur/server_error.dart';
import 'package:dio/dio.dart';

abstract class BaseRepository {
  Failure getErrorMessage(DioError error) {
    var serverError = ServerError.withError(error: error);
    return Failure(
      serverError.getErrorMessage(),
      code: serverError.getErrorCode(),
    );
  }
}
