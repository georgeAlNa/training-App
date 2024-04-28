import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class ChatData {
  Crud crud;
  ChatData(this.crud);
  postData(dynamic message) async {
    var response = await crud.postMethod(linkurl: AppLink.chat, data: {
      'text': message,
    });
    return response.fold((l) => l, (r) => r);
  }
}
