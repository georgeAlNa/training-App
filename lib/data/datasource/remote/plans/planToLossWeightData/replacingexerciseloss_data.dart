import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class ReplacingExerciseLossData {
  Crud crud;
  ReplacingExerciseLossData(this.crud);
  postData(String token, dynamic planId, dynamic oldExerciseiId,
      dynamic newExerciseiId) async {
    var response = await crud.postMethod(
      linkurl: '${AppLink.replacingExerciseLoss}/$oldExerciseiId',
      data: {
        'plan_id': planId,
        'Loss_id': newExerciseiId,
      },
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
