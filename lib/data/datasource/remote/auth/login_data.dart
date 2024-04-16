import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postLoginData(String email, String password) async {
    var response = await crud.postMethod(linkurl: AppLink.login, data: {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
