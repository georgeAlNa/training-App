import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AllCoachesData {
  Crud crud;
  AllCoachesData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.allCoaches, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
