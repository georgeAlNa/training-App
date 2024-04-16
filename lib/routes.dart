import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/middleware/mymiddleware.dart';
import 'package:training_app/test.dart';
import 'package:training_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:training_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:training_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:training_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:training_app/view/screen/auth/login.dart';
import 'package:training_app/view/screen/auth/login_admin.dart';
import 'package:training_app/view/screen/auth/signup.dart';
import 'package:training_app/view/screen/auth/success_signup.dart';
import 'package:training_app/view/screen/auth/verifycodesignup.dart';
import 'package:training_app/view/screen/calories%20-%20terget%20weight/calories.dart';
import 'package:training_app/view/screen/calories%20-%20terget%20weight/tergetweight.dart';
import 'package:training_app/view/screen/coaches/advicebycoach.dart';
import 'package:training_app/view/screen/favorite/allfavorite.dart';
import 'package:training_app/view/screen/home.dart';
import 'package:training_app/view/screen/language.dart';
import 'package:training_app/view/screen/adminpage.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/addchallenge.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/addexercise.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/allcategoryusercomplete.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/category.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/exercisedetail.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/exercises.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/level.dart';
import 'package:training_app/view/screen/on_boarding.dart';
import 'package:training_app/view/screen/userinfo.dart';
import 'package:training_app/view/screen/coaches/getallcoaches.dart';

List<GetPage<dynamic>>? routes = [
  //language
  GetPage(
    name: '/',
    page: () => const Language(),
    middlewares: [
      MyMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoutes.test,
    page: () => const Test(),
  ),
  //auth
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.loginAdmin,
    page: () => const LoginAdmin(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successSignup,
    page: () => const SuccessSignup(),
  ),
  GetPage(
    name: AppRoutes.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),

  //onboarding
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoarding(),
  ),

  //home
  GetPage(
    name: AppRoutes.home,
    page: () => const HomePage(),
  ),

  //level + category + exercises + exerciseDetail + add exercise + add challenge
  GetPage(
    name: AppRoutes.level,
    page: () => const LevelPage(),
  ),
  GetPage(
    name: AppRoutes.category,
    page: () => const CategoryPage(),
  ),
  GetPage(
    name: AppRoutes.exercises,
    page: () => const ExercisesPage(),
  ),
  GetPage(
    name: AppRoutes.exercisesDetail,
    page: () => ExerciseDetailPage(),
  ),
  GetPage(
    name: AppRoutes.addExercise,
    page: () => const AddExercisePage(),
  ),
  GetPage(
    name: AppRoutes.addChallenge,
    page: () => const AddChallengePage(),
  ),
  GetPage(
    name: AppRoutes.allCategoryComplete,
    page: () => const AllCategoryCompletePage(),
  ),
  

  //admin
  GetPage(
    name: AppRoutes.adminPage,
    page: () => const AdminPage(),
  ),

  //user info
  GetPage(
    name: AppRoutes.userInfo,
    page: () => const UserInfoPage(),
  ),

  //calories + target weight
  GetPage(
    name: AppRoutes.calories,
    page: () => const CaloriesPage(),
  ),
  GetPage(
    name: AppRoutes.targetWeight,
    page: () => const TargetWeightPage(),
  ),

  //favorites
  GetPage(
    name: AppRoutes.getAllFavorites,
    page: () => const AllFavoritePage(),
  ),

  //coaches
  GetPage(
    name: AppRoutes.getAllCoaches,
    page: () => const AllCoachesPage(),
  ),
  GetPage(
    name: AppRoutes.adviceByCoach,
    page: () => const AdviceByCoachPage(),
  ),
];
