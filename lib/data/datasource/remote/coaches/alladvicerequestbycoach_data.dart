import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AllAdviceRequestByCoachData {
  Crud crud;
  AllAdviceRequestByCoachData(this.crud);
  getData(dynamic token) async {
    var response = await crud.getMethod(
      linkurl: AppLink.allAdviceRequestByCoach,
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
