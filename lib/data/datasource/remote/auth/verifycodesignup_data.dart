import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class VerifycodeSignUpData {
  Crud crud;
  VerifycodeSignUpData(this.crud);
  postVerifycodeSignUpData(
      String email, String verifycode, String token1) async {
    var response = await crud.postMethod(
      linkurl: AppLink.verifycodeSignup,
      data: {
        'email': email,
        'verification_code': verifycode,
      },
      token: token1,
    );
    return response.fold((l) => l, (r) => r);
  }
}
