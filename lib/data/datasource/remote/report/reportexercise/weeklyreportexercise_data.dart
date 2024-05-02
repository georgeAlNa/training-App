import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class WeeklyReportExerciseData {
  Crud crud;
  WeeklyReportExerciseData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.weeklyReportExercise, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
