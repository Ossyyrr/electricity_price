import 'package:electricity_price/core/model/price_model.dart';
import 'package:flutter/material.dart';

class CustomColors {
  static Color semaphoreGreen = const Color(0xff98d90b);
  static Color semaphoreYellow = const Color(0xfff2d129);
  static Color semaphoreOrange = const Color(0xfff29422);
  static Color semaphoreRed = const Color(0xfff23e16);

  static Color getPriceColor(Price price) {
    if (price.isCheap! && price.isUnderAvg!) {
      return CustomColors.semaphoreGreen;
    } else if (price.isCheap! && !price.isUnderAvg!) {
      return CustomColors.semaphoreYellow;
    } else if (!price.isCheap! && price.isUnderAvg!) {
      return CustomColors.semaphoreOrange;
    } else if (!price.isCheap! && !price.isUnderAvg!) {
      return CustomColors.semaphoreRed;
    } else {
      return Colors.black;
    }
  }
}
