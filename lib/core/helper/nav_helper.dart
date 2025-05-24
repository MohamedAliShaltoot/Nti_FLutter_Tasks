import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class NavHelper {
  static push(Widget Function() dest, {Transition? transition}) {
    Get.to(dest, transition: transition ?? Transition.rightToLeftWithFade);
  }

  static pushReplace(Widget Function() dest, {Transition? transition}) {
    Get.off(dest, transition: transition ?? Transition.rightToLeftWithFade);
  }

  static pushReplaceAll(Widget Function() dest, {Transition? transition}) {
    Get.offAll(dest, transition: transition ?? Transition.rightToLeftWithFade);
  }

  static pop() {
    Get.back();
  }
}
