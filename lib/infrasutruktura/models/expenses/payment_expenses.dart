class PaymentExpenses {
  int id;
  String cost;

  PaymentExpenses({required this.id, required this.cost});

  Map<String, dynamic> toJson() => {'id': id, 'cost': cost};
}
