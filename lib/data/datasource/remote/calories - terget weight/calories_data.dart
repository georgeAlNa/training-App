import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class CaloriesData {
  Crud crud;
  CaloriesData(this.crud);
  postCaloriesData(
      String token, dynamic age, dynamic currentWeight, dynamic gender , dynamic height) async {
    var response = await crud.postMethod(
        linkurl: AppLink.calories,
        data: {
          'age': age,
          'Current_weight': currentWeight,
          'gender': gender,
          'height': height,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
