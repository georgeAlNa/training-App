import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class UserInfoData {
  Crud crud;
  UserInfoData(this.crud);
  getData(String token, dynamic idOfCalories) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.userInfo}/$idOfCalories', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
