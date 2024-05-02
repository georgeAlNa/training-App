import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';

abstract class AllReportStoreController extends GetxController {
  goToDailyReport();
  goToWeeklyReport();
  goToMonthlyReport();
  goToAnnualReport();
}

class AllReportStoreControllerImp extends AllReportStoreController {
  @override
  goToDailyReport() {
    Get.toNamed(AppRoutes.dailyReportStore);
  }

  @override
  goToWeeklyReport() {
    Get.toNamed(AppRoutes.weeklyReportStore);
  }

  @override
  goToMonthlyReport() {
    Get.toNamed(AppRoutes.monthlyReportStore);
  }

  @override
  goToAnnualReport() {
    Get.toNamed(AppRoutes.annualReportStore);
  }
}
