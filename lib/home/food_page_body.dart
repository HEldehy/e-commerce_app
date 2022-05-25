import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../constance/app_column.dart';
import '../constance/app_constance.dart';
import '../constance/big_text.dart';
import '../constance/color.dart';
import '../constance/dimensions.dart';
import '../constance/icon_and_text.dart';
import '../constance/small_text.dart';
import '../controlles/popular_product.dart';
import '../controlles/recommended_product_controller.dart';
import '../models/product_model.dart';
import '../routes/routes_helper.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);
  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController p_controller = PageController(
    viewportFraction: 0.85,
  );
  var currentPage = 0.0;
  double _scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    p_controller.addListener(() {
      setState(() {
        currentPage = p_controller.page!;
        // print("Current value is " + currentPage.toString());
      });
    });
  }

  void dispos() {
    p_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded
              ? Container(
                  //color: Colors.grey[200],
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: p_controller,
                      itemCount: popularProduct.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProduct.popularProductList[position]);
                      }),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: AppColor.mainColor,
                ));
        }),
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : popularProduct.popularProductList.length,
            position: currentPage,
            decorator: DotsDecorator(
              activeColor: AppColor.mainColor,
              size: Size.square(9),
              activeSize: Size(18.0, 9.0),
              //shape: const Border(),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: 'Food Paring',
                ),
              )
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(builder: (recommrndProduct) {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommrndProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return recommrndProduct.isLoaded
                    ? GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getRecommendedFood(index));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: Colors.white38,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              "/uploads/" +
                                              recommrndProduct
                                                  .recommendedProductList[index]
                                                  .img!),
                                      fit: BoxFit.cover,
                                    )),
                                width: Dimensions.listViewImageSize,
                                height: Dimensions.listViewImageSize,
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.listViewTextConstSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        right: Dimensions.width10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                            text: recommrndProduct
                                                .recommendedProductList[index]
                                                .name!),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        SmallText(
                                            text: 'With Egyptian Griedients'),
                                        SizedBox(
                                          height: Dimensions.height20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndText(
                                                icon: Icons.circle_sharp,
                                                text: 'Normal',
                                                iconColor: AppColor.iconColor1),
                                            IconAndText(
                                                icon: Icons.location_on,
                                                text: '1.7 km',
                                                iconColor: AppColor.mainColor),
                                            IconAndText(
                                                icon: Icons.access_time_rounded,
                                                text: '32 min',
                                                iconColor: AppColor.iconColor2),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: AppColor.mainColor,
                        ),
                      );
              });
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPage.floor()) {
      var curScale = 1 - (currentPage - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPage.floor() + 1) {
      var curScale =
          _scaleFactor + (currentPage - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPage.floor() - 1) {
      var curScale = 1 - (currentPage - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        "/uploads/" +
                        popularProduct.img!)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(
                      color: Colors.white,
                      //  blurRadius: 5.0,
                      offset: Offset(-5, 0)),
                  BoxShadow(
                      color: Colors.white,
                      //  blurRadius: 5.0,
                      offset: Offset(5, 0))
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
