import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DeleteOrderData {
  Crud crud;
  DeleteOrderData(this.crud);
  getDeleteData(String token, dynamic idOfOrder) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.storeDeleteOrder}/$idOfOrder', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
