import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AnnualReportExerciseData {
  Crud crud;
  AnnualReportExerciseData(this.crud);
  getData(String token , dynamic year) async {
    var response = await crud.getMethod(linkurl: '${AppLink.annualReportExercise}?year=$year', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
