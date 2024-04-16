import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AddFavoriteData {
  Crud crud;
  AddFavoriteData(this.crud);
  postAddFavoriteData(String token , dynamic idExercise) async {
    var response = await crud.postMethod(linkurl: AppLink.addFavorite, data: {
      'exercise_id': idExercise,
    },
    token: token);
    return response.fold((l) => l, (r) => r);
  }
}
