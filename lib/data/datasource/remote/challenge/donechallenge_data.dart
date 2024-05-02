import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DoneChallengeData {
  Crud crud;
  DoneChallengeData(this.crud);
  putData(String token, dynamic idofChallenge , dynamic idOfUser) async {
    var response = await crud.putMethod(
        linkurl: '${AppLink.doneChallenge}/$idofChallenge/$idOfUser', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
