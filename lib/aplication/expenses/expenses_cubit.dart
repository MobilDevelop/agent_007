import 'package:agent_007/aplication/expenses/expenses_state.dart';
import 'package:agent_007/domain/provider/expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/get_expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/payment_expenses.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial()) {
    init();
  }
  bool loading = true;
  bool paginationCheck = true;

  int pagination = 1;
  final paymentController = TextEditingController();
  
  List<ExpensesInfo> items = [];
  final scrollController = ScrollController();

  double animationSize1 = 0.0;
  double animationSize2 = 0.0;

  String checkType ='all';

  void init() async {
    loading =true;
    emit(ExpensesInitial());
    if (paginationCheck) {
      List<ExpensesInfo> newPage = await ExpensesService().getInfo(pagination);
      if (newPage.isNotEmpty) {
        pagination++;
        items.addAll(newPage);
      } else {
        paginationCheck = false;
      }
      loading = false;
      emit(ExpensesInitial());
    } else {
      loading = false;
      
    }
  }

  void payment(int id) async {
    String pay = paymentController.text.trim();
    if (pay.isNotEmpty) {
      final payment = PaymentExpenses(amount: pay);
      bool check = await ExpensesService().paymentMoney(payment, id);
      if (check) {
        pagination=1;
        paginationCheck=true;
        items.clear();
        init();
        emit(ExpensesSucces(tr('expenses.message')));
      } else {
        emit(ExpensesError(tr('expenses.error')));
      }
    } else {
      emit(ExpensesError(tr('expenses.empty')));
    }
  }

  ExpensesInfo? check(int index){
    if(checkType=='all'){
      return items[index];
    }else if(checkType=='paid' && items[index].status=="To'landi"){
      return items[index];
    }else if(checkType=='unpaid' &&items[index].status=="To'lanmagan"){
      return items[index];
    }else{
      return null;
    }
  }

  void animationOntap(int id, double width) {
    if (id == 1) {
      checkType='paid';
      animationSize1 = width * 0.75;
      animationSize2 = width * 0.15;
    }
    if (id == 2) {
      checkType='unpaid';
      animationSize2 = width * 0.75;
      animationSize1 = width * 0.15;
    }
    emit(ExpensesInitial());
  }
}
