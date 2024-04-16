import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class ExerciseData {
  Crud crud;
  ExerciseData(this.crud);
  getData(String token , int levelid , int categoryid) async {
    var response = await crud.getMethod(linkurl: '${AppLink.exercises}?level_id=$levelid&category_id=$categoryid', token: token);
    return response.fold((l) => l, (r) => r);
  }

  
}
