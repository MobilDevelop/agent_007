import 'package:agent_007/aplication/home/home_state.dart';
import 'package:agent_007/presentation/pages/dashboard/dashboard.dart';
import 'package:agent_007/presentation/pages/expenses/expenses_page.dart';
import 'package:agent_007/presentation/pages/settings/settings_page.dart';
import 'package:agent_007/presentation/pages/transfer/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  List<Widget> windows = [
    const Dashboard(),
    const ExpensesPage(),
    const TransferPage(),
    const SettingPage()
  ];

  void nextPage(int index) {
    currentIndex = index;
    emit(HomeInitial());
  }
}
