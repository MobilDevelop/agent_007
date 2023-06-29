import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:agent_007/infrasutruktura/models/expenses/add_expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/get_expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/payment_expenses.dart';
import 'package:dio/dio.dart';

class ExpensesService {
  final Dio dio = MyDio().dio();

  Future<List<ExpensesInfo>> getInfo() async {
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

  Future<bool> addExpenses(AddExpenses expenses) async {
    try {
      Response response = await dio.post(Constants.expenses);
      print(response);
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  Future<bool> paymentMoney(PaymentExpenses patment) async {
    try {
      Response response = await dio.post(Constants.expenses);
      print(response);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }
}
