import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

// class AllCategoryCompleteData {
//   Crud crud;
//   AllCategoryCompleteData(this.crud);
//   getData(String token) async {
//     var response = await crud.getMethod(linkurl: AppLink.allCategoryComplete, token: token);
//     return response.fold((l) => l, (r) => r);
//   }
// }

class AllExerciseCompleteData {
  Crud crud;
  AllExerciseCompleteData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.allExerciseComplete, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
