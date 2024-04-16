import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AddChallengeData {
  Crud crud;
  AddChallengeData(this.crud);
  postChallengeData(
    dynamic challengeName,
    dynamic description,
    dynamic endAt,
    dynamic exerciseids1,
    dynamic exerciseids2,
    dynamic exerciseids3,
    dynamic exerciseids4,
    dynamic exerciseids5,
    dynamic exerciseids6,
    dynamic exerciseids7,
    dynamic exerciseids8,
    dynamic exerciseids9,
    dynamic exerciseids10,
    String token,
  ) async {
    var response = await crud.postMethod(
        linkurl: AppLink.addChallenge,
        data: {
          'Challenge_name': challengeName,
          'Description': description,
          'end_at': endAt,
          'exercise_id1': exerciseids1,
          'exercise_id2': exerciseids2,
          'exercise_id3': exerciseids3,
          'exercise_id4': exerciseids4,
          'exercise_id5': exerciseids5,
          'exercise_id6': exerciseids6,
          'exercise_id7': exerciseids7,
          'exercise_id8': exerciseids8,
          'exercise_id9': exerciseids9,
          'exercise_id10': exerciseids10,
        },
        token: token);
    // for (var i = 0; i < exerciseids.length; i++) {
    //   exerciseids.addAll({'exercise_ids[$i]': exerciseids[i]});
    // }
    return response.fold((l) => l, (r) => r);
  }
}
