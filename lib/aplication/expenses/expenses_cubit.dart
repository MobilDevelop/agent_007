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

  void init() async {
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
      emit(ExpensesInitial());
    }
  }

  void payment(int id) async {
    String pay = paymentController.text.trim();
    if (pay.isNotEmpty) {
      final payment = PaymentExpenses(amount: pay);
      bool check = await ExpensesService().paymentMoney(payment, id);
      if (check) {
        emit(ExpensesSucces(tr('espenses.message')));
      } else {
        emit(ExpensesError(tr('expenses.error')));
      }
    } else {
      emit(ExpensesError(tr('expenses.empty')));
    }
  }
}
