import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DeleteFavoriteData {
  Crud crud;
  DeleteFavoriteData(this.crud);
  postDeleteFavoriteData(String token , dynamic idExercise) async {
    var response = await crud.postMethod(linkurl: AppLink.deleteFavorite, data: {
      'exercise_id': idExercise,
    },
    token: token);
    return response.fold((l) => l, (r) => r);
  }
}
