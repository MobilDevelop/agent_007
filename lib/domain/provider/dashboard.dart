import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:agent_007/infrasutruktura/models/dashboard/dashboard_model.dart';
import 'package:dio/dio.dart';

class DashboardService {
  Future<DashboardModel> init() async {
    final Dio dio = MyDio().dio();
    try {
      Response response = await dio.get(Constants.dashboard);
      final model = DashboardModel.fromJson(response.data['data']);
      return Future.value(model);
    } catch (error) {
      return Future.value(DashboardModel(
          allPrice: '0',
          status: '',
          currentBalans: '1',
          expenses: '0',
          name: '',
          payed: '0'));
    }
  }
}
