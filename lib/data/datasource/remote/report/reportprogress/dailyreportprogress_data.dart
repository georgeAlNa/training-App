import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DailyReportData {
  Crud crud;
  DailyReportData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.dailyReport, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
