import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class GetAllFavoriteData {
  Crud crud;
  GetAllFavoriteData(this.crud);
  getAllFavoriteData(String token) async {
    var response =
        await crud.getMethod(linkurl: AppLink.getAllFavorites, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
