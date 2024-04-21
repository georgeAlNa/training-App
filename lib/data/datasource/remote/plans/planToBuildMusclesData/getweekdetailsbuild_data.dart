import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class GetWeekDetailsBuilddData {
  Crud crud;
  GetWeekDetailsBuilddData(this.crud);
  getData(String token, dynamic idOfWeek) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.getWeekDetailsBuild}/$idOfWeek', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
