import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class AddToCartData {
  Crud crud;
  AddToCartData(this.crud);
  postData(
    String token,
    dynamic productId,
    dynamic orderId,
    dynamic amount,
  ) async {
    var response = await crud.postMethod(
        linkurl: '${AppLink.storeAddToCart}/$productId',
        data: {
          'product_id': productId,
          'order_id': orderId,
          'amount': amount,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
