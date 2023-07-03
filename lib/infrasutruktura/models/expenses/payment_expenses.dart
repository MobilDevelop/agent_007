class PaymentExpenses {
  String amount;

  PaymentExpenses({required this.amount});

  Map<String, dynamic> toJson() => {'amount': amount};
}
