import 'package:get/get.dart';

class Dimensions {
  static final double SCREEN_HEIGHT = Get.context!.height;
  static final double SCREEN_WIDTH = Get.context!.width;

  //Factor = screenHeight/containerHeight
  // Height = 844, width =390
  //Home -  FoodPageBody
  static final double PARENT_CONTAINER = SCREEN_HEIGHT / 2.81;
  static final double PAGE_VIEW_CONTAINER = SCREEN_HEIGHT / 3.84;
  static final double PAGE_VIEW_SECONDARY_CONTAINER = SCREEN_HEIGHT / 7.03;
  static final double LIST_VIEW_IMAGE_120 = SCREEN_HEIGHT / 7.03;
  static final double LIST_VIEW_DESCRIPTION_100 = SCREEN_HEIGHT / 8.44;

  // Height or padding and margin sizes
  static final double HEIGHT_5 = SCREEN_HEIGHT / 168.8;
  static final double HEIGHT_10 = SCREEN_HEIGHT / 84.4;
  static final double HEIGHT_15 = SCREEN_HEIGHT / 56.27;
  static final double HEIGHT_20 = SCREEN_HEIGHT / 42.2;
  static final double HEIGHT_30 = SCREEN_HEIGHT / 28.13;
  static final double HEIGHT_45 = SCREEN_HEIGHT / 18.76;

  // Height or padding and margin sizes
  static final double WIDTH_5 = SCREEN_WIDTH / 78.0;
  static final double WIDTH_10 = SCREEN_WIDTH / 39.0;
  static final double WIDTH_15 = SCREEN_WIDTH / 26;
  static final double WIDTH_20 = SCREEN_WIDTH / 19.5;
  static final double WIDTH_30 = SCREEN_WIDTH / 13.0;

  // Font sizes
  static final double FONT_20 = SCREEN_HEIGHT / 42.2;
  static final double FONT_12 = SCREEN_HEIGHT / 70.33;

  // Radius sizes
  static final double RADIUS_15 = SCREEN_HEIGHT / 56.27;
  static final double RADIUS_20 = SCREEN_HEIGHT / 42.2;
  static final double RADIUS_30 = SCREEN_HEIGHT / 28.13;

  // Icon sizes
  static final double ICON_SIZE_24 = SCREEN_HEIGHT / 35.17;
}
