import 'package:agent_007/aplication/add_expenses/add_expenses_state.dart';
import 'package:agent_007/domain/provider/expenses.dart';
import 'package:agent_007/infrasutruktura/models/expenses/add_expenses.dart';
import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensesCubit extends Cubit<AddExpensesState> {
  AddExpensesCubit() : super(AddExpensesInitial());

  UniversalModel? location;
  UniversalModel? costType;
  String amount = '';
  String description = '';

  void add() async {
    if (location == null ||
        costType == null ||
        amount.isEmpty ||
        description.isEmpty) {
      emit(EmptyInfo(tr('addexpenses.empty')));
    } else {
      AddExpenses add = AddExpenses(
          typeId: costType!.id,
          locationId: location!.id,
          amount: double.parse(amount),
          description: description);
      bool change = await ExpensesService().addExpenses(add);
      if (change) {
        emit(SuccesInfo());
      } else {
        emit(ErrorInfo(''));
      }
    }
  }
}
