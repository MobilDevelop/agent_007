class AddExpenses {
  int typeId;
  int locationId;
  double amount;
  String description;

  AddExpenses(
      {required this.typeId,
      required this.locationId,
      required this.amount,
      required this.description});

  Map<String, dynamic> toJson() => {
        'cost_type_id': typeId,
        'location_id': locationId,
        'description': description,
        'amount': amount
      };
}
