import 'package:get/get.dart';

import '../home/food_details.dart';
import '../home/main_page.dart';
import '../home/recommended_food_details.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';
  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () {
        return MainPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];

        return RecommendedFoodDetails(
          pageId:int.parse(pageId!)
        );
      },
      transition: Transition.fadeIn,
    ),
  ];
}
