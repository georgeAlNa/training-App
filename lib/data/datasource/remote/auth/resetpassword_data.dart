import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postResetpasswordData(String email, String code, String password) async {
    var response = await crud.postMethod(linkurl: AppLink.resetpassword, data: {
      'email': email,
      'code': code,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
