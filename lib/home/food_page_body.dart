import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/utils/app_colors.dart';
import 'package:food_ordering_app/widgets/icon_and_text_widget.dart';
import 'package:food_ordering_app/widgets/secondary_text.dart';
import 'package:food_ordering_app/widgets/title_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double heightContainer = 220.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        //print('Current Page Value  $_currentPageValue');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.PRIMARY_COLOR,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = heightContainer * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = heightContainer * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
      ;
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = heightContainer * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      var currentTrans = heightContainer * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: heightContainer,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: index.isEven ? Colors.blueAccent : Colors.amber,
                image: const DecorationImage(
                    image: AssetImage("assets/images/burger.png"),
                    fit: BoxFit.contain)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                      blurRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                      blurRadius: 1.0,
                    ),
                  ]
                  // image: const DecorationImage(
                  //   image: AssetImage("assets/images/burger.png"),
                  //   fit: BoxFit.contain,
                  // ),
                  ),
              child: Container(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: "Chinese Side"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.PRIMARY_COLOR,
                                    size: 15,
                                  )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SecondaryText(text: "4.5"),
                        const SizedBox(
                          width: 10,
                        ),
                        SecondaryText(text: "1234 comments"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            iconColor: AppColors.ICON_COLOR1,
                            text: "Normal",
                            icon: Icons.circle_sharp),
                        IconAndTextWidget(
                            iconColor: AppColors.PRIMARY_COLOR,
                            text: "1.7Km",
                            icon: Icons.location_on),
                        IconAndTextWidget(
                            iconColor: AppColors.ICON_COLOR2,
                            text: "32 min",
                            icon: Icons.access_time_rounded)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
