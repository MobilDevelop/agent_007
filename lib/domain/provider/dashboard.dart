import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:agent_007/infrasutruktura/models/dashboard/dashboard_model.dart';
import 'package:dio/dio.dart';

class DashboardService {
  

   Future<DashboardModel> registration()async{
    final Dio dio = MyDio().dio();
    try {
      Response response = await dio.get(Constants.dashboard);
      final model= DashboardModel.fromJson(response.data);
     return Future.value(model);
    } catch (e) {
      print(e);
      return Future.value(DashboardModel());
    }


  }
}