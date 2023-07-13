class DashboardModel{
  String name;
  String allPrice;
  String currentBalans;
  String expenses;
  String payed;
  String status;
  
  DashboardModel({required this.name,required this.allPrice,required this.currentBalans,required this.expenses,required this.payed,required this.status});

  factory DashboardModel.fromJson(Map<String,dynamic> json)=>DashboardModel(
    name: json['user']['full_name']??'',
    allPrice: json['monthly_income']??'0.0',
    currentBalans: json['cashbox']['balance']??'1.0',
    status: json['user']['status'],
    expenses: json['monthly_cost_total']??'0.0',
    payed: json['monthly_cost_payed']??'0.0'
  );

}