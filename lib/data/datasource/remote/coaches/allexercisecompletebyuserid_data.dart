import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AllExerciseCompleteByUserIdData {
  Crud crud;
  AllExerciseCompleteByUserIdData(this.crud);
  postData(String token, dynamic userId) async {
    var response = await crud.postMethod(
        linkurl: AppLink.allExerciseCompleteByUserId,
        data: {
          'user_id': userId,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
