import 'package:e_commerce_app/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controlles/popular_product.dart';
import 'controlles/recommended_product_controller.dart';
import 'home/food_details.dart';
import 'home/food_page_body.dart';
import 'home/main_page.dart';
import 'home/recommended_food_details.dart';
import 'helper/dependencies.dart' as dep;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App ',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MainPage(),
      //initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes ,
    );
  }
}
//get
