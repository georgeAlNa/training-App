import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/level-category-exercises/allcategoryusercomplete_data.dart';

abstract class AllCategoryCompleteController extends GetxController {
  getAllCategoryCompleteData();
}

class AllCategoryCompleteControllerImp extends AllCategoryCompleteController {
  AllCategoryCompleteData allCategoryCompleteData =
      AllCategoryCompleteData(Get.find());
  late StatusRequest statusRequest;
  List completeCategory = [];
  MyService myService = Get.find();
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getAllCategoryCompleteData();
    super.onInit();
  }

  @override
  getAllCategoryCompleteData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await allCategoryCompleteData.getData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'completed category') {
        completeCategory.addAll(response['data']);
      }
      if (completeCategory.isEmpty) {
        Get.defaultDialog(title: 'Empty', middleText: 'No Data ! Still Empty');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
