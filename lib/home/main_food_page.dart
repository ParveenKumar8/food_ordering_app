import 'package:flutter/material.dart';
import 'package:food_ordering_app/home/food_page_body.dart';
import 'package:food_ordering_app/utils/app_colors.dart';
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
            margin: const EdgeInsets.only(top: 45.0),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                        width: 45,
                        height: 45,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.PRIMARY_COLOR,
                        )),
                  ),
                ]),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}
