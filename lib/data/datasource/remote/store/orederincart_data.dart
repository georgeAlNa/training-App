import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class OredersInCartData {
  Crud crud;
  OredersInCartData(this.crud);
  getData(String token, dynamic idOfUser) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.storeOrdersInCart}/$idOfUser', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
