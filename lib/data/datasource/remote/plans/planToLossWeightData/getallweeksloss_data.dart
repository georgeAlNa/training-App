import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class GetAllWeeksLossData {
  Crud crud;
  GetAllWeeksLossData(this.crud);
  getData(String token) async {
    var response =
        await crud.getMethod(linkurl: AppLink.getAllWeeksLoss, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
