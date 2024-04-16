import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postSignupData(String username, String email, String password) async {
    var response = await crud.postMethod(
      linkurl: AppLink.signUp,
      data: {
        'name': username,
        'email': email,
        'password': password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
