import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  late StatusRequest statusRequest;
  List data = [];
  String? token;
  MyService myService = Get.find();
  Map doneExerciseMap = {};
  // getData() async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await testData.getData();
  //   print('0000000 $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failuer;
  //     }
  //   }
  //   update();
  // }

  // doneExercise() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   token = myService.sharedPreferences.getString('token');

  //   var response = await testData.postDoneExerciseData(
  //     token!,
  //     1,
  //     4,
  //     0,
  //   );
  //   print('response ===== $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['message'] == 'Workout verification recorded successfully') {
  //       doneExerciseMap.addAll(response['message']);
  //       Get.offAllNamed(AppRoutes.home);
  //       // Get.defaultDialog(
  //       //     title: 'success',
  //       //     middleText: 'Workout verification recorded successfully');
  //     }
  //     if (response['message'] == 'don\'t west time again') {
  //       Get.defaultDialog(
  //           title: "Not Good", middleText: "don't west time again");
  //     }
  //     if (response['message'] == 'Workout already completed for today') {
  //       Get.defaultDialog(
  //           title: "Sorry !",
  //           middleText: "This Workout already completed for today");
  //     }
  //     //   else {
  //     //   statusRequest = StatusRequest.failuer;
  //     //   Get.defaultDialog(title: "Sorry !", middleText: "fail");
  //     // }
  //     update();
  //   }

  //   // else {
  //   //   statusRequest = StatusRequest.failuer;
  //   //   Get.defaultDialog(title: "Sorry !", middleText: "fail");
  //   // }
  // }

  @override
  void onInit() {
    // doneExercise();
    super.onInit();
  }
}
