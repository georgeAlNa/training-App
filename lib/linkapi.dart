class AppLink {
  //auth
  static const String root = 'http://192.168.1.103:8000/api';

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

  //user info
  static const String userInfo = '$root/GetDetails';

  // done  exercise
  static const String doneExercises = '$root/is_done';

  //calories + target weight
  static const String calories = '$root/calculate';
  static const String targetWeight = '$root/TargetWeight';

  //favorite
  static const String addFavorite = '$root/Favorite';
  static const String getAllFavorites = '$root/GetFavorite';
  static const String deleteFavorite = '$root/deleteFav';
}
