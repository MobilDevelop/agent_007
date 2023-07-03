List<GetTransfer> transferFromMap(List list) => List<GetTransfer>.from(
    list.map((element) => GetTransfer.fromJson(element)));

class GetTransfer {
  int id;
  String title;
  String amount;
  String description;
  String status;
  String date;
  String type;

  GetTransfer(
      {required this.id,
      required this.title,
      required this.amount,
      required this.description,
      required this.status,
      required this.type,
      required this.date});

  factory GetTransfer.fromJson(Map<String, dynamic> json) => GetTransfer(
      id: json['id'] ?? 0,
      title: json['cashier']['full_name'] ?? '',
      amount: json['amount'].toString(),
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      type: json['type']??'',
      date: json['date'] ?? '');
}
