import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AdviceByCoachData {
  Crud crud;
  AdviceByCoachData(this.crud);
  getData(String token , dynamic idOfCoach) async {
    var response =
        await crud.getMethod(linkurl: '${AppLink.adviceByCoach}/$idOfCoach', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
