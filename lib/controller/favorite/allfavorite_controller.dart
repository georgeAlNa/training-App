import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/favorite/getallfavorite_data.dart';
import 'package:training_app/data/datasource/remote/favorite/deletefavorite_data.dart';

abstract class AllFavoriteController extends GetxController {
  getAllFAvoriteData();
  getDeleteFromFavoriteData(dynamic idofExerciseWantDelete);
  refreshPage();
}

class AllFavoriteControllerImp extends AllFavoriteController {
  GetAllFavoriteData getAllFavoriteData = GetAllFavoriteData(Get.find());
  DeleteFavoriteData deleteFavoriteData = DeleteFavoriteData(Get.find());
  late StatusRequest statusRequest;
  List allFavoriteList = [];
  MyService myService = Get.find();
  String? token;
  // dynamic idOfExerciseRespDel;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    // idOfExerciseRespDel =
    //     myService.sharedPreferences.getInt('idExercisefromResponse');

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
        allFavoriteList.addAll(response['favorites']);
      } else {
        if (allFavoriteList.isEmpty) {
          Get.defaultDialog(title: 'Empty!', middleText: 'Favorite Empty');
        }
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  getDeleteFromFavoriteData(idofExerciseWantDelete) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteFavoriteData.getDeleteFavoriteData(
        token!, idofExerciseWantDelete);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'Favorite exercise deleted successfully') {
        // allFavoriteList.addAll(response['favorites']);

        Get.offAllNamed(AppRoutes.home);
        update();
      }
    } else if (response['message'] == 'not found') {
      Get.defaultDialog(title: 'error', middleText: 'not found');
      statusRequest = StatusRequest.failuer;
    }
    update();
  }

  @override
  refreshPage() async {
    allFavoriteList.clear();
    await getAllFAvoriteData();
  }
}
