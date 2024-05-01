import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AddProductByAdminData {
  Crud crud;
  AddProductByAdminData(this.crud);
  postData(String token, String namePro, String imagePro, String costPro,
      String amountPro, String cateIdPro, String pointsCostPro) async {
    var response = await crud.postMethod(
        linkurl: AppLink.storeAddProductByAdmin,
        data: {
          'name': namePro,
          'image': imagePro,
          'cost': costPro,
          'amount': amountPro,
          'Cate_id': cateIdPro,
          'points_cost': pointsCostPro,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
