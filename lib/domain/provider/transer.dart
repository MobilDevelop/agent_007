import 'dart:async';

import 'package:agent_007/domain/common/constants.dart';
import 'package:agent_007/domain/my_dio/my_dio.dart';
import 'package:agent_007/infrasutruktura/models/transfer/get_transfer.dart';
import 'package:agent_007/infrasutruktura/models/transfer/money_transfer.dart';
import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TransferService {
  final Dio dio = MyDio().dio();

  Future<List<GetTransfer>> getTransfer() async {
    try {
      Response response = await dio.get(Constants.transfer);
      print(response);
      return Future.value(transferFromMap(response.data['data']));
    } catch (error) {
      EasyLoading.showInfo(error.toString());
      return Future.value(transferFromMap([]));
    }
  }

  Future<bool> moneyTranfer(MoneyTransfer transfer) async {
    try {
      Response response =
          await dio.post(Constants.moneytransfer, data: transfer.toJson());
      print(response);
      return Future.value(true);
    } catch (error) {
      EasyLoading.showInfo(error.toString());
      return Future.value(false);
    }
  }

  Future<bool> transferConfirmation(int id) async {
    try {
      Response response = await dio.put(Constants.confirmation + id.toString());
      print(response);
      return Future.value(true);
    } catch (error) {
      EasyLoading.showInfo(error.toString());
      return Future.value(false);
    }
  }

  Future<List<UniversalModel>> getAllAgent() async {
    try {
      Response response = await dio.get(Constants.allAgent);
      print(response);
      return Future.value(allAgentFromMap(response.data['data']));
    } catch (error) {
      EasyLoading.showInfo(error.toString());
      return Future.value(allAgentFromMap([]));
    }
  }
}
