import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class UpdatePaymentStateByAdminData {
  Crud crud;
  UpdatePaymentStateByAdminData(this.crud);
  getData(String token, String orderId) async {
    var response = await crud.getMethod(
        linkurl: '${AppLink.storeUpdatePaymentStateByAdmin}/$orderId', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
