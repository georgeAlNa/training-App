import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);
  postForgetPasswordData(String email) async {
    var response =
        await crud.postMethod(linkurl: AppLink.forgetpassword, data: {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
