import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/utils/app_colors.dart';
import 'package:food_ordering_app/utils/dimensions.dart';
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
  final double heightContainer = Dimensions.PAGE_VIEW_CONTAINER;

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
    //print('Screen height is  ${Dimensions.HEIGHT_30} ${Dimensions.WIDTH_30}');
    return Column(
      children: [
        //Slider Section
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: Dimensions.PARENT_CONTAINER,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // DotIndicator Section
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
        ),
        SizedBox(
          height: Dimensions.HEIGHT_30,
        ),
        // Popular title
        Container(
          margin: EdgeInsets.only(left: Dimensions.WIDTH_30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TitleText(text: "Popular"),
              SizedBox(
                width: Dimensions.WIDTH_10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3.0),
                child: TitleText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.WIDTH_10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2.0),
                child: SecondaryText(text: "Food Pairing"),
              )
            ],
          ),
        ),
        //List of popular products
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.WIDTH_20,
                    right: Dimensions.WIDTH_20,
                    bottom: Dimensions.HEIGHT_10),
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.LIST_VIEW_IMAGE_120,
                      height: Dimensions.LIST_VIEW_IMAGE_120,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_20),
                          color: index.isEven ? Colors.blue : Colors.amber,
                          image: const DecorationImage(
                              image: AssetImage("assets/images/burger.png"),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.LIST_VIEW_DESCRIPTION_100,
                        margin: EdgeInsets.symmetric(
                            vertical: Dimensions.HEIGHT_10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.RADIUS_20),
                              bottomRight:
                                  Radius.circular(Dimensions.RADIUS_20),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.WIDTH_10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(text: "Nutritious fruit meal in China"),
                              SizedBox(
                                height: Dimensions.HEIGHT_10,
                              ),
                              SecondaryText(
                                  text: "With Chinese Characteristics"),
                              SizedBox(
                                height: Dimensions.HEIGHT_10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
            }),
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
            height: Dimensions.PAGE_VIEW_CONTAINER,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_30),
                color: index.isEven ? Colors.blueAccent : Colors.amber,
                image: const DecorationImage(
                    image: AssetImage("assets/images/burger.png"),
                    fit: BoxFit.contain)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.PAGE_VIEW_SECONDARY_CONTAINER,
              margin: EdgeInsets.only(
                  left: Dimensions.WIDTH_30,
                  right: Dimensions.WIDTH_30,
                  bottom: Dimensions.HEIGHT_30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_20),
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
                    SizedBox(
                      height: Dimensions.HEIGHT_10,
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
                    SizedBox(
                      height: Dimensions.HEIGHT_20,
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
