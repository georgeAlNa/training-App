import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DailyReportExerciseData {
  Crud crud;
  DailyReportExerciseData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.dailyReportExercise, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
