import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class BuyProductByPointsData {
  Crud crud;
  BuyProductByPointsData(this.crud);
  getData(String token, dynamic idOfProduct, dynamic idOfUser) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.storeBuyProductByPoints}/$idOfProduct/$idOfUser',
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
