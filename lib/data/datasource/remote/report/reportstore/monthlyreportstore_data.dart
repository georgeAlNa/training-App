import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class MonthlyReportStoreData {
  Crud crud;
  MonthlyReportStoreData(this.crud);
  getData(String token , dynamic month) async {
    var response = await crud.getMethod(linkurl: '${AppLink.monthlyReportStore}?month=$month', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
