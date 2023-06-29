abstract class ExpensesState {
  const ExpensesState();
}

class ExpensesInitial extends ExpensesState {}

class ExpensesSucces extends ExpensesState {
  String message;
  ExpensesSucces(this.message);
}

class ExpensesError extends ExpensesState {
  String message;
  ExpensesError(this.message);
}
