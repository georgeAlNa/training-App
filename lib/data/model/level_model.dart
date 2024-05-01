class LevelModel {
  int? id;
  String? level;
  dynamic createdAt;
  dynamic updatedAt;

  LevelModel({this.id, this.level, this.createdAt, this.updatedAt});

  LevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['level'] = level;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}