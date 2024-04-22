import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class GetWeekDetailsLossdData {
  Crud crud;
  GetWeekDetailsLossdData(this.crud);
  getData(String token, dynamic idOfWeek) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.getWeekDetailsLoss}/$idOfWeek', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
