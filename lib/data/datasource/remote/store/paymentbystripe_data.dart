import 'package:training_app/core/class/crud.dart';
import 'package:training_app/linkapi.dart';

class PaymentByStripeData {
  Crud crud;
  PaymentByStripeData(this.crud);
  postData(
    int number,
    int expMonth,
    int expYear,
    int cvc,
    int amount,
    dynamic description,
  ) async {
    var response = await crud.postMethod(
      linkurl: AppLink.storePaymentByStripe,
      data: {
        'number': number,
        'exp_month': expMonth,
        'exp_year': expYear,
        'amount': amount,
        'description': description,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
