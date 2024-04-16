import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/favorite/getallfavorite_data.dart';

abstract class AllFavoriteController extends GetxController {
  getAllFAvoriteData();
}

class AllFavoriteControllerImp extends AllFavoriteController {
  GetAllFavoriteData getAllFavoriteData = GetAllFavoriteData(Get.find());
  late StatusRequest statusRequest;
  List allFavoriteList = [];
  MyService myService = Get.find();
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getAllFAvoriteData();
    super.onInit();
  }

  @override
  getAllFAvoriteData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getAllFavoriteData.getAllFavoriteData(token!);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allFavoriteList.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
