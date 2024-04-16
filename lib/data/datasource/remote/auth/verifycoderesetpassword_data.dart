import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class VerifycodeResetPasswordData {
  Crud crud;
  VerifycodeResetPasswordData(this.crud);
  postVerifycodeResetPasswordData(String email, String verifycode) async {
    var response =
        await crud.postMethod(linkurl: AppLink.verifycodeResetpassword, data: {
      'email': email,
      'code': verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
