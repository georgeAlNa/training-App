class AppLink {
  //auth
  static const String root = 'http://10.0.2.2:8000/api';

  static const String signUp = '$root/register';
  static const String verifycodeSignup = '$root/verify';

  static const String login = '$root/login';
  static const String loginAdmin = '$root/admin';

  static const String forgetpassword = '$root/forgot';
  static const String verifycodeResetpassword = '$root/check_code';
  static const String resetpassword = '$root/reset';

  //level + category + exercises
  static const String level = '$root/level';
  static const String category = '$root/categaroy';
  static const String exercises = '$root/exercise';
  static const String addChallenge = '$root/challenge';
  static const String addExercise = '$root/exercise';
  static const String allCategoryComplete = '$root/record';
  static const String allExerciseComplete = '$root/getExerciseRecord';

  //user info
  static const String userInfo = '$root/GetDetails';

  // done  exercise + category
  static const String doneExercises = '$root/verifyExercise';
  static const String doneCategory = '$root/is_done';

  //calories + target weight
  static const String calories = '$root/calculate';
  static const String targetWeight = '$root/TargetWeight';

  //favorite
  static const String addFavorite = '$root/Favorite';
  static const String getAllFavorites = '$root/AllFavorite';
  static const String deleteFavorite = '$root/deleteFav';

  //coaches
  static const String allCoaches = '$root/getCoach';
  static const String adviceByCoach = '$root/Get';
  static const String rateAdvice = '$root/experience';
  static const String addAdvice = '$root/advice';
  static const String allExerciseCompleteByUserId = '$root/getExerciseRecord';
  static const String askForAdvice = '$root/requestAdvice';
  static const String allAdviceRequestByCoach = '$root/getrequest';

  //challenge
  static const String allChallenges = '$root/allchallenges';
  static const String challengeInfo = '$root/getChallInfo';
  static const String enrollChallenge = '$root/enroll';
  static const String doneChallenge = '$root/completed';

  //search
  static const String search = '$root/search';

  //plans to build muscles
  static const String getAllWeeksBuild = '$root/GetWeek';
  static const String getWeekDetailsBuild = '$root/PlanForUser';
  static const String replacingExerciseBuild = '$root/UpdatePlane';

  //plans to loss weight
  static const String getAllWeeksLoss = '$root/GetWeek';
  static const String getWeekDetailsLoss = '$root/PlanForWeightLoss';
  static const String replacingExerciseLoss = '$root/UpdatePlaneForWeightLoss';

  //store
  static const String storeCategory = '$root/GetCategory';
  static const String storeProductByCategory = '$root/GetProduct';
  static const String storeAddToCart = '$root/addtocart';
  static const String storeSearch = '$root/searchproduct';
  static const String storeOrdersInCart = '$root/getorder';
  static const String storeOrderDetails = '$root/getorderwithproduct';
  static const String storeDeleteOrder = '$root/DeleteOrder';
  static const String storeBuyProductByPoints = '$root/buywithpoints';
  static const String storeAddProductByAdmin = '$root/addproduct';
  static const String storeUpdatePaymentStateByAdmin = '$root/updatepayment';
  static const String storePaymentByStripe = '$root/Payment';

  //chat
  static const String chat = '$root/chat';

  //report progress
  static const String dailyReportProgress = '$root/DailyProgress';
  static const String weeklyReportProgress = '$root/WeeklyProgress';
  static const String monthlyReportProgress = '$root/MonthlyProgress';
  static const String annualReportProgress = '$root/annualProgress';
  //report store
  static const String dailyReportStore = '$root/Dailyorder';
  static const String weeklyReportStore = '$root/Weeklyorder';
  static const String monthlyReportStore = '$root/Monthlyorder';
  static const String annualReportStore = '$root/annualorder';
  //report exercise
  static const String dailyReportExercise = '$root/DailyExe';
  static const String weeklyReportExercise = '$root/WeeklyExe';
  static const String monthlyReportExercise = '$root/MonthExe';
  static const String annualReportExercise = '$root/annualExe';
  static const String getExerciseByIdReport = '$root/GetExercise';
}
