import 'package:get/get.dart';

class Dimensions {
  static final double SCREEN_HEIGHT = Get.context!.height;
  static final double SCREEN_WIDTH = Get.context!.width;

  //Factor = screenHeight/containerHeight
  // Height = 844, width =390
  //Home
  static double PAGE_VIEW_CONTAINER = SCREEN_HEIGHT / 3.84;
  static double PAGE_VIEW_SECONDARY_CONTAINER = SCREEN_HEIGHT / 7.03;
}
