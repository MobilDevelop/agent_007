class DashboardModel{
  String? name='';
  String? allPrice='0';
  String? currentBalans='0';
  String? expenses='0';
  
  DashboardModel({this.name,this.allPrice,this.currentBalans,this.expenses});

  factory DashboardModel.fromJson(Map<String,dynamic> json)=>DashboardModel(
    name: json['full_name'],
    allPrice: json['monthly_income'].toString(),
    currentBalans: json['cashbox']['balance'],
    expenses: json['monthly_cost'].toString()
  );

}