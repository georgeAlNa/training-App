import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AddExerciseData {
  Crud crud;
  AddExerciseData(this.crud);
  postExerciseData(
    String levelId,
    String categoryId,
    String name,
    String description,
    String date,
    String video,
    String token,
  ) async {
    var response = await crud.postMethod(
        linkurl: AppLink.addExercise,
        data: {
          'Level_id': levelId,
          'category_id': categoryId,
          'name': name,
          'description': description,
          'date': date,
          'video': video,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
