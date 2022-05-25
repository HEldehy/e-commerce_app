import 'package:e_commerce_app/constance/small_text.dart';
import 'package:flutter/material.dart';
import 'big_text.dart';
import 'color.dart';
import 'dimensions.dart';
import 'icon_and_text.dart';
class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text,
            size: Dimensions.font26,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      color: AppColor.mainColor,
                      size: Dimensions.icon24,
                    )),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: '4.5'),
              SizedBox(
                width: Dimensions.width5,
              ),
              SmallText(text: '1234'),
              SizedBox(width: Dimensions.width5,),
              SmallText(text: 'Comments'),
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
