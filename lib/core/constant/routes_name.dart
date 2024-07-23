class AppRoutes {
  static const String test = "/test";

  //auth
  static const String login = "/login";
  static const String loginAdmin = "/login_admin";
  static const String loginCoach = "/login_coach";
  static const String signup = "/signup";
  static const String forgetPassword = "/forget_password";
  static const String verifyCode = "/verify_code";
  static const String resetPassword = "/reset_password";
  static const String successResetPassword = "/success_reset_password";
  static const String successSignup = "/success_signup";
  static const String verifyCodeSignUp = "/verify_code_signup";

  //search
  static const String search = '/search';
  static const String getExerciseByIdSearch = '/get_exercise_by_id_search';
  //lang + on boarding
  static const String language = "/language";
  static const String onBoarding = "/on_boarding";

  //home
  static const String home = "/home";

  //level + category + exercise
  static const String level = "/level";
  static const String category = "/category";
  static const String exercises = "/exercises";
  static const String exercisesDetail = "/exercise_detail";
  static const String addExercise = "/add_exercise";
  static const String addChallenge = "/add_challenge";
  static const String allCategoryComplete = "/all_category_complete";
  static const String allExerciseComplete = "/all_exercise_complete";
  //static const String doneExercise = "/done_exercise";

  //admin page
  static const String adminPage = "/admin_page";

  //user info
  static const String userInfo = "/user_info";

  //calories + target weight
  static const String calories = "/calories";
  static const String targetWeight = "/target_weight";

  // favorites
  static const String getAllFavorites = "/all_favorites";
  //static const String doneAddToFavorite = "/done_add_to_favorite";

  //coaches
  static const String getAllCoaches = "/get_all_coaches";
  static const String adviceByCoach = "/advice_by_coach";
  static const String rateAdvice = "/rate_advice";
  static const String addAdvice = "/add_advice";
  static const String allExerciseCompleteByUserId =
      "/all_exercise_complete_by_user_id";
  static const String allAdviceRequestByCoach = "/all_advice_request_by_coach";

  //challenge
  static const String getAllChallenges = "/get_all_challenges";
  static const String challengeInfo = "/challenge_info";
  static const String enrollChallenge = "/enroll_challenge";

  //plan to build muscles
  static const String getAllWeeksBuild = "/get_all_weeks_build";
  static const String getWeekDetailsBuild = "/get_week_details_build";
  static const String replacingExerciseBuild = "/replacing_exercise_build";
  static const String getExerciseDetailsBuild = "/get_exercise_details_build";

  //plan to loss weight
  static const String getAllWeeksLoss = "/get_all_weeks_loss";
  static const String getWeekDetailsLoss = "/get_week_details_loss";
  static const String replacingExerciseLoss = "/replacing_exercise_loss";
  static const String getExerciseDetailsLoss = "/get_exercise_details_loss";

  //store
  static const String storeCategory = "/store_category";
  static const String storeProductByCategory = "/store_product_by_category";
  static const String storeProductDetails = "/store_product_details";
  static const String storeAddToCart = "/store_add_to_cart";
  static const String storeGetAllOrders = "/store_get_all_orders";
  static const String storeOrederDetails = "/store_oreder_details";
  static const String storeAddProductByAdmin = "/store_add_product_by_admin";
  static const String storeUpdatePaymentStateByAdmin =
      "/store_update_payment_state_by_admin";

  // chat
  static const String chat = "/chat";

  //report progress
  static const String reportProgress = "/report_proress";
  static const String dailyReportProgress = "/daily_report_proress";
  static const String weeklyReportProgress = "/weekly_report_proress";
  static const String monthlyReportProgress = "/monthly_report_proress";
  static const String annualReportProgress = "/annual_report_proress";
  //report store
  static const String reportStore = "/report_store";
  static const String dailyReportStore = "/daily_report_store";
  static const String weeklyReportStore = "/weekly_report_store";
  static const String monthlyReportStore = "/monthly_report_store";
  static const String annualReportStore = "/annual_report_store";
  //report exercise
  static const String reportExercise = "/report_exercise";
  static const String dailyReportExercise = "/daily_report_exercise";
  static const String weeklyReportExercise = "/weekly_report_exercise";
  static const String monthlyReportExercise = "/monthly_report_exercise";
  static const String annualReportExercise = "/annual_report_exercise";
  static const String getExerciseByIdReport = "/get_exercise_by_id_report";
}
