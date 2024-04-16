class LevelModel {
  int? id;
  String? level;
  Null createdAt;
  Null updatedAt;

  LevelModel({this.id, this.level, this.createdAt, this.updatedAt});

  LevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}