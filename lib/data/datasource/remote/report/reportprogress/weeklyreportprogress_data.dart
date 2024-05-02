import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class WeeklyReportData {
  Crud crud;
  WeeklyReportData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.weeklyReportProgress, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
