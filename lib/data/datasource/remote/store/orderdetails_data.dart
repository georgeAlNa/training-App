import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class OrederDetailsData {
  Crud crud;
  OrederDetailsData(this.crud);
  getData(String token, dynamic idOfOrder) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.storeOrderDetails}/$idOfOrder', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
