import 'package:electricity_price/core/model/price_model.dart';
import 'package:electricity_price/core/repository/price_repository.dart';
import 'package:electricity_price/layout/utils/custom_colors.dart';
import 'package:electricity_price/layout/widget/today_prices/caption_item.dart';
import 'package:flutter/material.dart';

class PriceUtils {
  static Color getPriceIconColor(Price price) {
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

  static Color? getPriceColor(Price price) {
    final priceRepo = PricesRepository();
    if (price.price == priceRepo.maxPrice.price) {
      return CustomColors.semaphoreRed;
    } else if (price.price == priceRepo.minPrice.price) {
      return CustomColors.semaphoreGreen;
    } else if (price.price == priceRepo.currentPrice.price) {
      return CustomColors.current;
    } else {
      return null;
    }
  }

  static Widget getPriceCaption(Price price) {
    if (price.isCheap! && price.isUnderAvg!) {
      return CaptionItem(
        color: CustomColors.semaphoreGreen,
        text: 'Cheap',
      );
    } else if (price.isCheap! && !price.isUnderAvg!) {
      return CaptionItem(
        color: CustomColors.semaphoreYellow,
        text: 'Under avg',
      );
    } else if (!price.isCheap! && price.isUnderAvg!) {
      return CaptionItem(
        color: CustomColors.semaphoreOrange,
        text: 'Above avg',
      );
    } else {
      return CaptionItem(
        color: CustomColors.semaphoreRed,
        text: 'Expensive',
      );
    }
  }
}
