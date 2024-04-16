import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class LevelData {
  Crud crud;
  LevelData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.level, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
