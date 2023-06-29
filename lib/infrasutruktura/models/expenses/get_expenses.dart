List<ExpensesInfo> infoFromMap(List list)=>List<ExpensesInfo>.from(list.map((element) => ExpensesInfo.fromJson(element)));


class ExpensesInfo{
  int id;
  String name;
  String location;
  String costtype;
  String amount;
  String payed;
  String deskription;
  String status;
  String date;
  bool paybtn;

  ExpensesInfo({
    required this.id,
    required this.name,
    required this.location,
    required this.costtype,
    required this.amount,
    required this.payed,
    required this.deskription,
    required this.status,
    required this.date,
    required this.paybtn});

    factory ExpensesInfo.fromJson(Map<String,dynamic> json)=>ExpensesInfo(
      id: json['id']??0, 
      name: json['auth']['full_name'],
      location: json['location']['title']??'', 
      costtype: json['cost_type']['title']??'', 
      amount: json['amount']??'', 
      payed: json['payed']??'', 
      deskription: json['description']??'', 
      status: json['status']??'', 
      date: json['date']??'', 
      paybtn: json['pay_btn']??false);
}