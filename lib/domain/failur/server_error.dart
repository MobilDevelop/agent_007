// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = '';

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  int? getErrorCode() => _errorCode;

  String getErrorMessage() => _errorMessage;

  String _handleError(DioError error) {
    _errorCode = error.response?.statusCode ?? 500;
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        _errorMessage = 'Connection Time out';
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = 'Send Time out';
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = 'Resive Time out';
        break;
      case DioErrorType.badResponse:
        {
          try {
            _errorMessage = error.response!.data['message'].toString();
            print(
              "++++++++++++++ ${error.response!.data['message'].toString()}",
            );
          } catch (e) {
            _errorMessage = 'Something went wrong';
          }
          // if (_errorCode! >= 500) {
          //   _errorMessage = 'Internal server error';
          // } else if (_errorCode == 400) {
          //   // Todo: Some logic
          // } else if (_errorCode == 401) {
          //   _errorMessage = 'Unauthorized';
          // } else if (_errorCode == 423) {
          //   // Todo: Some logic
          //
          // }
          break;
        }
      case DioErrorType.cancel:
        _errorMessage = 'Canceled';
        break;
      case DioErrorType.unknown:
        _errorMessage = 'Boshqa error Dio';
        break;
      default:
        _errorMessage = 'something went wrong';
    }
    return _errorMessage;
  }
}
