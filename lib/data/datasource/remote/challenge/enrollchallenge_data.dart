import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class EnrollChallengeData {
  Crud crud;
  EnrollChallengeData(this.crud);
  getData(String token, dynamic idofChallenge) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.enrollChallenge}/$idofChallenge', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
