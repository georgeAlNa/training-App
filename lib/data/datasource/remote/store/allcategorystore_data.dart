import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class StoreCategoryData {
  Crud crud;
  StoreCategoryData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.storeCategory, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
