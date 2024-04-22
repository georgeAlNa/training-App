import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class ReplacingExerciseBuildData {
  Crud crud;
  ReplacingExerciseBuildData(this.crud);
  postData(String token, dynamic planId, dynamic oldExerciseiId,
      dynamic newExerciseiId) async {
    var response = await crud.postMethod(
      linkurl: '${AppLink.replacingExerciseBuild}/$oldExerciseiId',
      data: {
        'plan_id': planId,
        'exercise_id': newExerciseiId,
      },
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
