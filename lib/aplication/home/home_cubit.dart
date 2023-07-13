import 'package:agent_007/aplication/home/home_state.dart';
import 'package:agent_007/domain/provider/dashboard.dart';
import 'package:agent_007/infrasutruktura/models/dashboard/dashboard_model.dart';
import 'package:agent_007/presentation/pages/dashboard/dashboard.dart';
import 'package:agent_007/presentation/pages/expenses/expenses_page.dart';
import 'package:agent_007/presentation/pages/report/report_page.dart';
import 'package:agent_007/presentation/pages/settings/settings_page.dart';
import 'package:agent_007/presentation/pages/transfer/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()){
    init();
  }
  var currentBackPressTime;
  int currentIndex = 0;
  DashboardModel? model;
  List<Widget> windows = [
    const Dashboard(),
    const ExpensesPage(),
    const TransferPage(),
    const SettingPage()
  ];

  void init()async{
     model = await DashboardService().init();
    if(model?.status=='admin'){
        windows = [
    const Dashboard(),
    const ExpensesPage(),
    const TransferPage(),
    const ReportPage(),
    const SettingPage()
  ];
    }
  emit(HomeInitial());
  }

  void nextPage(int index) {
    currentIndex = index;
    emit(HomeInitial());
  }


  Future<bool> onWillPop() async {
   if(currentIndex==0){
     DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      EasyLoading.showToast('Dasturdan chiqish uchun yana bir marta bosing!');
      return Future.value(false);
    }
    return Future.value(true);
  }else{
    currentIndex=0;
    emit(HomeInitial());
    return Future.value(false);
  }
   }
}
