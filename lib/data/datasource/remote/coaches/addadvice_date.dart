import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AddAdviceData {
  Crud crud;
  AddAdviceData(this.crud);
  postAdviceeData(
    String message,
    String trainerId,
    String token,
  ) async {
    var response = await crud.postMethod(
        linkurl: AppLink.addAdvice,
        data: {
          'message': message,
          'trainer_id': trainerId,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
