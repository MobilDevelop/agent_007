
List<UniversalModel> locationFromMap(List list) => List<UniversalModel>.from(
    list.map((element) => UniversalModel.fromLocation(element)));

List<UniversalModel> costTypeFromMap(List list) => List<UniversalModel>.from(
    list.map((element) => UniversalModel.fromCostType(element)));

class UniversalModel {
  int id;
  String title;

  UniversalModel({required this.id, required this.title});

  factory UniversalModel.fromLocation(Map<String, dynamic> json) =>
      UniversalModel(id: json['id']??0, title: json['title']??"");

  factory UniversalModel.fromCostType(Map<String, dynamic> json) =>
      UniversalModel(id: json['id']??0, title: "${json['title']??''}  (${json['code']??''})");
}
