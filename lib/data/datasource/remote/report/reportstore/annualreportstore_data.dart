import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AnnualReportStoreData {
  Crud crud;
  AnnualReportStoreData(this.crud);
  getData(String token , dynamic year) async {
    var response = await crud.getMethod(linkurl: '${AppLink.annualReportStore}?year=$year', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
