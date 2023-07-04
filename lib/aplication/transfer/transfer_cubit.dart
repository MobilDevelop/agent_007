import 'package:agent_007/aplication/transfer/transfer_state.dart';
import 'package:agent_007/domain/provider/transer.dart';
import 'package:agent_007/infrasutruktura/models/transfer/get_transfer.dart';
import 'package:agent_007/infrasutruktura/models/transfer/money_transfer.dart';
import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitial()) {
    init();
    getAllItems();
  }

  bool loading = true;

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  double animationSize1 = 0.0;
  double animationSize2 = 0.0;

  List<UniversalModel> allAgent = [];
  UniversalModel? selectAgent;

  List<GetTransfer> items = [];

  int pagination =1;
  bool paginationCheck = true;

  String checkType = 'all';

  void init() async {
    allAgent = await TransferService().getAllAgent();
    loading = false;
    emit(TransferInitial());
  }

  void getAllItems()async{
    loading =true;
    emit(TransferInitial());
    if (paginationCheck) {
      List<GetTransfer> newPage = await TransferService().getTransfer(pagination);
      if (newPage.isNotEmpty) {
        pagination++;
        items.addAll(newPage);
      } else {
        paginationCheck = false;
      }
      loading = false;
      emit(TransferInitial());
    } else {
      loading = false;
     
    } 
  }

  void moneyTransfer() async {
    String amount = amountController.text.trim();
    String description = descriptionController.text.trim();
    if (amount.isEmpty || description.isEmpty || selectAgent == null) {
      emit(TransferError(tr("expenses.empty")));
    } else {
      MoneyTransfer transfer = MoneyTransfer(
          sourceId: selectAgent!.id,
          amount: double.parse(amount),
          description: description);

      bool check = await TransferService().moneyTranfer(transfer);
      if (check) {
        pagination=1;
        paginationCheck=true;
        items.clear();
        getAllItems();
        emit(TransferSucces(tr("universal.succes")));
      } else {
        emit(TransferError(tr("universal.err")));
      }
    }
  }

  void confirmation(int id) async {
    bool check = await TransferService().transferConfirmation(id);
    if (check) {
      emit(TransferSucces(tr('universal.confirmation')));
      pagination=1;
      paginationCheck=true;
      items.clear();
      getAllItems();
    } else {
      emit(TransferError(tr("universal.err")));
    }
  }

  void cancellation(int id)async{
    bool check = await TransferService().transferCancellation(id);
    if (check) {
      emit(TransferSucces(tr('universal.cancellation')));
      pagination=1;
      paginationCheck=true;
      items.clear();
      getAllItems();
    } else {
      emit(TransferError(tr("universal.err")));
    }
  }

  void select(UniversalModel? model) {
    selectAgent = model;
  }


  GetTransfer? check(int index){
     if(checkType=='Kirim' && items[index].type=='Kirim'){
      return items[index];
    }else if(checkType=='Chiqim' && items[index].type=='Chiqim'){
      return items[index];
    }else if(checkType=='all'){
      return items[index];
    }
     return null;
  }

  void animationOntap(int id, double width) {
    if (id == 1) {
      checkType='Kirim';
      animationSize1 = width * 0.75;
      animationSize2 = width * 0.15;
    }
    if (id == 2) {
      checkType='Chiqim';
      animationSize2 = width * 0.75;
      animationSize1 = width * 0.15;
    }
    emit(TransferInitial());
  }
}
