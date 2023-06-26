import 'package:agent_007/aplication/add_transfer/add_expenses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensesCubit extends Cubit<AddExpensesState> {
  AddExpensesCubit() : super(AddExpensesInitial());
}
