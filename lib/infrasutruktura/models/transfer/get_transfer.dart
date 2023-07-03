List<GetTransfer> transferFromMap(List list) => List<GetTransfer>.from(
    list.map((element) => GetTransfer.fromJson(element)));

class GetTransfer {
  int id;
  String title;
  String amount;
  String description;
  String status;
  String date;

  GetTransfer(
      {required this.id,
      required this.title,
      required this.amount,
      required this.description,
      required this.status,
      required this.date});

  factory GetTransfer.fromJson(Map<String, dynamic> json) => GetTransfer(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      amount: json[''] ?? 0,
      description: json[''] ?? '',
      status: json[''] ?? '',
      date: json[''] ?? '');
}
