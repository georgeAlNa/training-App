import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.category, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
