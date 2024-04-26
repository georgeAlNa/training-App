import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class StoreProductByCategoryData {
  Crud crud;
  StoreProductByCategoryData(this.crud);
  getData(String token, dynamic idOfCategory) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.storeProductByCategory}/$idOfCategory', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
