import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:agent_007/infrasutruktura/models/expenses/get_expenses.dart';
import 'package:dio/dio.dart';

class ExpensesService{
     
     
     
    Future<List<ExpensesInfo>> getInfo()async{
    final Dio dio = MyDio().dio();
    try {
      Response response = await dio.get(Constants.expenses);
      print(response);
      List<ExpensesInfo> items = infoFromMap(response.data['data']);
    return Future.value(items);
     } catch (e) {
     print(e);
    return Future.value(infoFromMap([]));
    }


  }
}