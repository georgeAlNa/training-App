import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class GetExerciseByIdReportData {
  Crud crud;
  GetExerciseByIdReportData(this.crud);
  getData(String token , dynamic idOfExe) async {
    var response = await crud.getMethod(linkurl: '${AppLink.getExerciseByIdReport}/$idOfExe', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
