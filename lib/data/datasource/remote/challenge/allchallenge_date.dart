import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AllChallengeData {
  Crud crud;
  AllChallengeData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.allChallenges, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
