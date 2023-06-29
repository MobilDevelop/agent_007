import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:agent_007/infrasutruktura/models/dashboard/dashboard_model.dart';
import 'package:dio/dio.dart';

class DashboardService {
  

   Future<DashboardModel> init()async{
    final Dio dio = MyDio().dio();
    try {
      Response response = await dio.get(Constants.dashboard);
      final model= DashboardModel.fromJson(response.data['data']);
     return Future.value(model);
    } catch (e) {

      return Future.value(DashboardModel(allPrice: '0.0', currentBalans: '1.0', expenses: '0.0', name: '',payed: ''));
    }


  }
}