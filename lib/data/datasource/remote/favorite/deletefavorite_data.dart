import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DeleteFavoriteData {
  Crud crud;
  DeleteFavoriteData(this.crud);
  getDeleteFavoriteData(String token, dynamic idExercise) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.deleteFavorite}/$idExercise', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
