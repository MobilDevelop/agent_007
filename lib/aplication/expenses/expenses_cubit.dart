import 'package:agent_007/aplication/expenses/expenses_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());
  int activId = -1;
  double height = 60.0.h;

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
