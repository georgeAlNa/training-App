import 'package:training_app/core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  // getData() async {
  //   //var response = await crud.postData(linkurl: AppLink.server, data: {});
  //   //return response.fold((l) => l, (r) => r);
  // }

  // postDoneExerciseData(
  //     String token, dynamic levelId, dynamic categoryId, dynamic isDone) async {
  //   var response = await crud.postMethod(
  //       linkurl: AppLink.doneExercises,
  //       data: {
  //         'level_id': levelId,
  //         'category_id': categoryId,
  //         'is_done': isDone,
  //       },
  //       token: token);
  //   return response.fold((l) => l, (r) => r);
  // }
}
