import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/infrasutruktura/local_source/local_source.dart';
import 'package:agent_007/infrasutruktura/models/registration/registration_send.dart';
import 'package:dio/dio.dart';

class RegistrationService {
  final dio = Dio();

  Future<bool> registration(Registration registration) async {
    try {
      Response response =
          await dio.post(Constants.registration, data: registration.toJson());
      LocalSource.putInfo('token', response.data);
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
}
