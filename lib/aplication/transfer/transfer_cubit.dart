import 'package:agent_007/aplication/transfer/transfer_state.dart';
import 'package:agent_007/domain/provider/transer.dart';
import 'package:agent_007/infrasutruktura/models/transfer/get_transfer.dart';
import 'package:agent_007/infrasutruktura/models/transfer/money_transfer.dart';
import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitial()) {
    init();
  }

  bool loading = true;

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  double animationSize1 = 0.0;
  double animationSize2 = 0.0;

  List<UniversalModel> allAgent = [];
  UniversalModel? selectAgent;

  List<GetTransfer> items = [];

  void init() async {
    allAgent = await TransferService().getAllAgent();
    loading = false;
    emit(TransferInitial());
  }

  void moneyTransfer() async {
    String amount = amountController.text.trim();
    String description = descriptionController.text.trim();
    if (amount.isEmpty || description.isEmpty || selectAgent == null) {
      emit(TransferError("message"));
    } else {
      MoneyTransfer transfer = MoneyTransfer(
          sourceId: selectAgent!.id,
          amount: double.parse(amount),
          description: description);

      bool check = await TransferService().moneyTranfer(transfer);
      if (check) {
        emit(TransferSucces("message"));
      } else {
        emit(TransferError("message"));
      }
    }
  }

  void confirmation(int id) async {
    bool check = await TransferService().transferConfirmation(id);
    if (check) {
      emit(TransferSucces("message"));
    } else {
      emit(TransferError("message"));
    }
  }

  void select(UniversalModel? model) {
    print(model);
  }

  void animationOntap(int id, double width) {
    if (id == 1) {
      animationSize1 = width * 0.75;
      animationSize2 = width * 0.15;
    }
    if (id == 2) {
      animationSize2 = width * 0.75;
      animationSize1 = width * 0.15;
    }
    emit(TransferInitial());
  }
}
