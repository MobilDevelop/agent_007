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

  Future<List<GetTransfer>> getTransfer(int page) async {
    try {
      Response response = await dio.get(Constants.transfer,data: {'page':page});
    
      return Future.value(transferFromMap(response.data['data']));
    } catch (error) { 
      return Future.value(transferFromMap([]));
    }
  }

  Future<bool> moneyTranfer(MoneyTransfer transfer) async {
    try {
      Response response =
          await dio.post(Constants.moneytransfer, data: transfer.toJson());
   EasyLoading.showSuccess(response.data['message'].toString());
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  Future<bool> transferConfirmation(int id) async {
    try {
      Response response = await dio.put(Constants.confirmation + id.toString());
   EasyLoading.showSuccess(response.data['message'].toString());
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
  
  Future<bool> transferCancellation(int id) async {
    try {
      Response response = await dio.put(Constants.cancellation + id.toString());
      EasyLoading.showSuccess(response.data['message'].toString());
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  Future<List<UniversalModel>> getAllAgent() async {
    try {
      Response response = await dio.get(Constants.allAgent);
      print(response);
      return Future.value(allAgentFromMap(response.data['data']));
    } catch (error) {
      return Future.value(allAgentFromMap([]));
    }
  }
}
