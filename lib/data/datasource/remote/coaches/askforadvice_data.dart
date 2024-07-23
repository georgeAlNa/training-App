import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AskForAdviceData {
  Crud crud;
  AskForAdviceData(this.crud);
  postData(dynamic token, dynamic couchId, dynamic requestAdvice) async {
    var response = await crud.postMethod(
      linkurl: AppLink.askForAdvice,
      data: {
        'couch_id': couchId,
        'request_advice': requestAdvice,
      },
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
