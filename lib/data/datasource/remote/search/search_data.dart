import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  getData(String token, dynamic searchContent) async {
    var response =
        await crud.getMethod(linkurl: '${AppLink.search}/$searchContent', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
