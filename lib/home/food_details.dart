import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constance/app_column.dart';
import '../constance/app_constance.dart';
import '../constance/big_text.dart';
import '../constance/color.dart';
import '../constance/dimensions.dart';
import '../constance/exendable_text.dart';
import '../constance/icon_app.dart';
import '../controlles/card_controller.dart';
import '../controlles/popular_product.dart';
import 'card.dart';
import 'main_page.dart';


class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CardController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConstants.BASE_URL + "/uploads/" + product.img!),
                )),
              )),
          Positioned(
              top: Dimensions.height50,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => MainPage());
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                      )),
                 GetBuilder<PopularProductController>(
                     builder: (controller){
                       return Stack(children: [
                         GestureDetector(
                             onTap:(){
                               Get.to(CardPage());
                             },
                             child: AppIcon(icon: Icons.shopping_cart_outlined)),
                         Get.find<PopularProductController>().totalItems>1?
                         GestureDetector(
                           onTap:(){
                             Get.to(CardPage());
                           },
                           child: Positioned(
                             right:0,
                             top:0,
                             child: AppIcon(icon: Icons.circle,size: 20,
                               iconColor: Colors.transparent,
                               backGroundColor: AppColor.mainColor,
                             ),
                           ),
                         ):
                         Container(),
                         Get.find<PopularProductController>().totalItems>1?
                         Positioned(
                           right:0,
                           top:0,
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 5),
                             child: BigText(text:
                             Get.find<PopularProductController>().
                             totalItems.toString(),
                             size: 12,color: Colors.white,),
                           ),
                         ):
                         Container()



                       ],);
                     })
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - Dimensions.width20,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.width20 - 5,
                    ),
                    BigText(text: 'Introduce'),
                    SizedBox(
                      height: Dimensions.width20 - 5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(text: product.description!),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          height: Dimensions.height120,
          padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          decoration: BoxDecoration(
              color: AppColor.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColor.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width20 / 2,
                    ),
                    BigText(text: popularProduct.inCardItem.toString()),
                    SizedBox(
                      width: Dimensions.width20 / 2,
                    ),
                    InkWell(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColor.signColor,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: BigText(
                      text: '\$ ${product.price!} | Add To Card',
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColor.mainColor,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
