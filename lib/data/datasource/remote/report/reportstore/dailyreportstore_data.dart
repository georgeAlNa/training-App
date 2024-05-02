import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class DailyReportStoreData {
  Crud crud;
  DailyReportStoreData(this.crud);
  getData(String token) async {
    var response = await crud.getMethod(linkurl: AppLink.dailyReportStore, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
