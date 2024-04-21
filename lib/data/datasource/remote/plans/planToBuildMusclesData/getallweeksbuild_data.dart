import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class GetAllWeeksBuildData {
  Crud crud;
  GetAllWeeksBuildData(this.crud);
  getData(String token) async {
    var response =
        await crud.getMethod(linkurl: AppLink.getAllWeeksBuild, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
