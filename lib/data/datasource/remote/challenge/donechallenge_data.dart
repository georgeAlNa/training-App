import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DoneChallengeData {
  Crud crud;
  DoneChallengeData(this.crud);
  putData(String token, dynamic idofChallenge) async {
    var response = await crud.putMethod(
        linkurl: '${AppLink.doneChallenge}/$idofChallenge', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
