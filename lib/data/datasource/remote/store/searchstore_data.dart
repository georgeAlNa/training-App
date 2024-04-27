import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class StoreSearchData {
  Crud crud;
  StoreSearchData(this.crud);
  getData(String token, dynamic searchContent) async {
    var response =
        await crud.getMethod(linkurl: '${AppLink.storeSearch}/$searchContent', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
