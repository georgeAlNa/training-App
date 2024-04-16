import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class LoginAdminData {
  Crud crud;
  LoginAdminData(this.crud);
  postLoginAdminData(String email, String password) async {
    var response = await crud.postMethod(linkurl: AppLink.loginAdmin, data: {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
