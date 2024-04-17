import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class RateAdviceData {
  Crud crud;
  RateAdviceData(this.crud);
  getData(String token, dynamic idOfAdvcie, dynamic idOfRate) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.rateAdvice}/$idOfAdvcie/$idOfRate', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
