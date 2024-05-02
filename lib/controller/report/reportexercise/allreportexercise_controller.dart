import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';

abstract class AllReportExerciseController extends GetxController {
  goToDailyReport();
  goToWeeklyReport();
  goToMonthlyReport();
  goToAnnualReport();
}

class AllReportExerciseControllerImp extends AllReportExerciseController {
  @override
  goToDailyReport() {
    Get.toNamed(AppRoutes.dailyReportExercise);
  }

  @override
  goToWeeklyReport() {
    Get.toNamed(AppRoutes.weeklyReportExercise);
  }

  @override
  goToMonthlyReport() {
    Get.toNamed(AppRoutes.monthlyReportExercise);
  }

  @override
  goToAnnualReport() {
    Get.toNamed(AppRoutes.annualReportExercise);
  }
}
