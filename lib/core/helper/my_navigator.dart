import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyNavigator
{
  static void navigateTo({required Widget screen})
  {
    Get.to(()=> screen,
      duration: Duration(seconds: 1),
      transition: Transition.rightToLeft
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context)=> screen));
  }
}