abstract class AddExpensesState {
  AddExpensesState();
}

class AddExpensesInitial extends AddExpensesState {}

class EmptyInfo extends AddExpensesState {
  String message;
  EmptyInfo(this.message);
}

class SuccesInfo extends AddExpensesState {}

class ErrorInfo extends AddExpensesState {
  String message;
  ErrorInfo(this.message);
}
