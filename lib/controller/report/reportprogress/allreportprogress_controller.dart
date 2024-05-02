import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';

abstract class AllReportProgressController extends GetxController {
  goToDailyReport();
  goToWeeklyReport();
  goToMonthlyReport();
  goToAnnualReport();
}

class AllReportProgressControllerImp extends AllReportProgressController {
  @override
  goToDailyReport() {
    Get.toNamed(AppRoutes.dailyReportProgress);
  }

  @override
  goToWeeklyReport() {
    Get.toNamed(AppRoutes.weeklyReportProgress);
  }

  @override
  goToMonthlyReport() {
    Get.toNamed(AppRoutes.monthlyReportProgress);
  }

  @override
  goToAnnualReport() {
    Get.toNamed(AppRoutes.annualReportProgress);
  }
}
