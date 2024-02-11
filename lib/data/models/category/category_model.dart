class CategoryModel {
  String? sId;
  String? title;
  int? iV;

  CategoryModel({this.sId, this.title, this.iV});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['__v'] = this.iV;
    return data;
  }
}
