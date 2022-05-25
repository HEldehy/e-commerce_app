import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constance/app_constance.dart';
import '../constance/big_text.dart';
import '../constance/color.dart';
import '../constance/dimensions.dart';
import '../constance/icon_app.dart';
import '../constance/small_text.dart';
import '../controlles/card_controller.dart';
import 'food_details.dart';
import 'food_page_body.dart';
import 'main_page.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(MainPage());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backGroundColor: AppColor.mainColor,
                      iconSize: Dimensions.icon24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(MainPage());
                    },
                    child: AppIcon(
                      icon: Icons.home,
                      iconColor: Colors.white,
                      backGroundColor: AppColor.mainColor,
                      iconSize: Dimensions.icon24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backGroundColor: AppColor.mainColor,
                    iconSize: Dimensions.icon24,
                  )
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 10,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CardController>(
                    builder: (cardController) {
                      return ListView.builder(
                          itemCount: cardController.getItems.length,
                          itemBuilder: (_, index) {
                            return Container(
                              height: Dimensions.height20 * 5,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Container(
                                    width: Dimensions.height20 * 5,
                                    height: Dimensions.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstants.BASE_URL +
                                                "/uploads/" +
                                                cardController
                                                    .getItems[index].img!),
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: Dimensions.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cardController
                                              .getItems[index].name!,
                                          color: Colors.black,
                                        ),
                                        SmallText(
                                          text: 'Spicy',
                                          color: Colors.black,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: cardController
                                                  .getItems[index].price!
                                                  .toString(),
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                left: Dimensions.width10,
                                                right: Dimensions.width10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      //  popularProduct.setQuantity(false);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: AppColor.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width20 / 2,
                                                  ),
                                                  BigText(text: '0'
                                                      //popularProduct.inCardItem.toString()
                                                      ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width20 / 2,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        //popularProduct.setQuantity(true);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColor.signColor,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
