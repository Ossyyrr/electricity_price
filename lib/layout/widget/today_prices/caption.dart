import 'package:electricity_price/layout/utils/custom_colors.dart';
import 'package:electricity_price/layout/widget/today_prices/caption_item.dart';
import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  const Caption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CaptionItem(
          color: CustomColors.semaphoreGreen,
          text: 'Cheap',
        ),
        CaptionItem(
          color: CustomColors.semaphoreYellow,
          text: 'Under average',
        ),
        CaptionItem(
          color: CustomColors.semaphoreOrange,
          text: 'Above average',
        ),
        CaptionItem(
          color: CustomColors.semaphoreRed,
          text: 'Expensive',
        ),
      ],
    );
  }
}
