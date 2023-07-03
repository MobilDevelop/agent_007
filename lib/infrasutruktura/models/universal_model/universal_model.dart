List<UniversalModel> locationFromMap(List list) => List<UniversalModel>.from(
    list.map((element) => UniversalModel.fromLocation(element)));

List<UniversalModel> costTypeFromMap(List list) => List<UniversalModel>.from(
    list.map((element) => UniversalModel.fromCostType(element)));

List<UniversalModel> allAgentFromMap(List list) => List<UniversalModel>.from(
    list.map((element) => UniversalModel.fromAllAgent(element)));

class UniversalModel {
  int id;
  String title;

  UniversalModel({required this.id, required this.title});

  factory UniversalModel.fromLocation(Map<String, dynamic> json) =>
      UniversalModel(id: json['id'] ?? 0, title: json['title'] ?? "");

  factory UniversalModel.fromCostType(Map<String, dynamic> json) =>
      UniversalModel(
          id: json['id'] ?? 0,
          title: "${json['title'] ?? ''}  (${json['code'] ?? ''})");

  factory UniversalModel.fromAllAgent(Map<String, dynamic> json) =>
      UniversalModel(id: json['id'] ?? 0, title: json['full_name'] ?? '');
}
