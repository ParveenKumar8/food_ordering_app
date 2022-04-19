import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/home/food_page_body.dart';
import 'package:food_ordering_app/utils/app_colors.dart';
import 'package:food_ordering_app/utils/dimensions.dart';
import 'package:food_ordering_app/widgets/secondary_text.dart';
import 'package:food_ordering_app/widgets/title_text.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: Dimensions.HEIGHT_45,
              bottom: Dimensions.HEIGHT_15,
            ),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.WIDTH_15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    TitleText(
                      text: "India",
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    Row(
                      children: [
                        SecondaryText(
                          text: "Punjab",
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ]),
                  Center(
                    child: Container(
                        width: Dimensions.HEIGHT_45,
                        height: Dimensions.HEIGHT_45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.ICON_SIZE_24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_15),
                          color: AppColors.PRIMARY_COLOR,
                        )),
                  ),
                ]),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
