class MoneyTransfer {
  int sourceId;
  double amount;
  String description;

  MoneyTransfer(
      {required this.sourceId,
      required this.amount,
      required this.description});

  Map<String, dynamic> toJson() => {
        "type": "output",
        "source": "other_cashbox",
        "source_id": sourceId,
        "amount": amount,
        "description": description
      };
}
