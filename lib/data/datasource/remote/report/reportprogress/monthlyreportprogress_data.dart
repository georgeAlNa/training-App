import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class MonthlyReportData {
  Crud crud;
  MonthlyReportData(this.crud);
  getData(String token , dynamic month) async {
    var response = await crud.getMethod(linkurl: '${AppLink.monthlyReport}?month=$month', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
