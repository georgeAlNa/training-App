import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class TargetWeightData {
  Crud crud;
  TargetWeightData(this.crud);
  postTargetWeightData(String token, dynamic age, dynamic gender,
      dynamic height, dynamic currentWeight, String targetWeight) async {
    var response = await crud.postMethod(
        linkurl: AppLink.targetWeight,
        data: {
          'age': age,
          'gender': gender,
          'height': height,
          'Current_weight': currentWeight,
          'Target_weight': targetWeight,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
