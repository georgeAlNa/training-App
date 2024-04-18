class AppRoutes {
  static const String test = "/test";

  //auth
  static const String login = "/login";
  static const String loginAdmin = "/login_admin";
  static const String signup = "/signup";
  static const String forgetPassword = "/forget_password";
  static const String verifyCode = "/verify_code";
  static const String resetPassword = "/reset_password";
  static const String successResetPassword = "/success_reset_password";
  static const String successSignup = "/success_signup";
  static const String verifyCodeSignUp = "/verify_code_signup";

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

  //challenge
  static const String getAllChallenges = "/get_all_challenges";
  static const String challengeInfo = "/challenge_info";
  static const String enrollChallenge = "/enroll_challenge";
}
