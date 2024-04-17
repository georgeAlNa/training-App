import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class ChallengeInfoData {
  Crud crud;
  ChallengeInfoData(this.crud);
  getData(String token, dynamic idofChallenge) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.challengeInfo}/$idofChallenge', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
