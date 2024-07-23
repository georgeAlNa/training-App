import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DoneExerciseData {
  Crud crud;
  DoneExerciseData(this.crud);
  postDoneExerciseData(
      String token, dynamic exerciseId, dynamic isDone , dynamic idOfUse) async {
    var response = await crud.postMethod(
        linkurl: '${AppLink.doneExercises}',
        data: {
          'exercise_id' : exerciseId,
          'is_done': isDone,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}

// class DoneCategoryData {
//   Crud crud;
//   DoneCategoryData(this.crud);
//   postDoneCategoryData(
//       String token, dynamic levelId, dynamic categoryId, dynamic isDone) async {
//     var response = await crud.postMethod(
//         linkurl: AppLink.doneExercises,
//         data: {
//           'level_id': levelId,
//           'category_id': categoryId,
//           'is_done': isDone,
//         },
//         token: token);
//     return response.fold((l) => l, (r) => r);
//   }
// }
