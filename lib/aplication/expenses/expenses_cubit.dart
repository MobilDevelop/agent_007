import 'package:agent_007/aplication/expenses/expenses_state.dart';
import 'package:agent_007/domain/provider/expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/get_expenses.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial()){
    init();
  }
  int activId = -1;
  double height = 60.0.h;
  bool loding = true;
  List<ExpensesInfo> items =[];


   void init()async{
    items =await ExpensesService().getInfo();
    loding=false;
    emit(ExpensesInitial());
   } 

  void activChoose(int id) {
    if (activId == id) {
      activId = -1;
      height = 60.0.h;
    } else {
      activId = id;
      height = 260.0.h;
    }
    emit(ExpensesInitial());
  }
}
