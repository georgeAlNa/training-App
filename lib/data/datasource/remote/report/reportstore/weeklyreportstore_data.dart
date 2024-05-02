import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class WeeklyReportStoreData {
  Crud crud;
  WeeklyReportStoreData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.weeklyReportStore, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
