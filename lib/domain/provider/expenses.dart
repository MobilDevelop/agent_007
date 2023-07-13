import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:agent_007/infrasutruktura/models/expenses/add_expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/get_expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/payment_expenses.dart';
import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ExpensesService {
  final Dio dio = MyDio().dio();

  Future<List<ExpensesInfo>> getInfo(int pagination) async {
    try {
      Response response =
          await dio.get(Constants.expenses, data: {"page": pagination.toString()});
      List<ExpensesInfo> items = infoFromMap(response.data['data']);
      return Future.value(items);
    } catch (error) {
      return Future.value(infoFromMap([]));
    }
  }

  Future<bool> addExpenses(AddExpenses expenses) async {
    try {
      Response response =
          await dio.post(Constants.expenses, data: expenses.toJson());
      print(response);
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  Future<bool> paymentMoney(PaymentExpenses payment, int id) async {
    try {
      Response response = await dio.put(Constants.payment + id.toString(),
          data: payment.toJson());
      EasyLoading.showSuccess(response.data['message'].toString());
      return Future.value(true);
    } catch (error) {
  return Future.value(false);
    }
  }

  Future<List<UniversalModel>> getLocations() async {
    try {
      Response response = await dio.get(Constants.location);
      return Future.value(locationFromMap(response.data['data']));
    } catch (error) {
      return Future.value(locationFromMap([]));
    }
  }

  Future<List<UniversalModel>> getTypeCost() async {
    try {
      Response response = await dio.get(Constants.cosyType);
      return Future.value(costTypeFromMap(response.data['data']));
    } catch (error) {
      return Future.value(locationFromMap([]));
    }
  }
}
