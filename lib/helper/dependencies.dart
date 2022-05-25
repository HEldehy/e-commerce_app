import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constance/app_constance.dart';
import '../controlles/card_controller.dart';
import '../controlles/popular_product.dart';
import '../controlles/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repostory/card_repo.dart';
import '../data/repostory/popular_product_repo.dart';
import '../data/repostory/recommended_producct_repo.dart';


Future<void>init()async{
  //api client
  Get.lazyPut(()=>ApiClient(apiBaseUrl:AppConstants.BASE_URL ));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CardRepo());

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController( recommendedProductRepo: Get.find()));
  Get.lazyPut(() =>CardController(cardRepo:Get.find()));







}