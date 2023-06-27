class DashboardModel{
  String name;
  String allPrice;
  String currentBalans;
  String expenses;
  
  DashboardModel({required this.name,required this.allPrice,required this.currentBalans,required this.expenses});

  factory DashboardModel.fromJson(Map<String,dynamic> json)=>DashboardModel(
    name: json['data']['user']['full_name']??'',
    allPrice: json['data']['monthly_income'].toString(),
    currentBalans: json['data']['cashbox']['balance']??'',
    expenses: json['data']['monthly_cost'].toString()
  );

}