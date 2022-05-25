import 'package:e_commerce_app/constance/small_text.dart';
import 'package:flutter/material.dart';

import '../constance/big_text.dart';
import '../constance/color.dart';
import '../constance/dimensions.dart';
import 'food_page_body.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Egypt',
                      color: AppColor.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Cairo',
                          color: Colors.black54,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                        )
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    height: Dimensions.height45,
                    width: Dimensions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.icon24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColor.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: FoodPageBody())),
      ],
    ));
  }
}
