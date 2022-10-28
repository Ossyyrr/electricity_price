import 'package:electricity_price/core/repository/price_repository.dart';
import 'package:electricity_price/layout/utils/custom_colors.dart';
import 'package:electricity_price/layout/widget/price_stat_card.dart';
import 'package:flutter/material.dart';

class PriceStatsCards extends StatelessWidget {
  const PriceStatsCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceRepo = PricesRepository();

    return Wrap(
      children: [
        PriceStatCard(
          title: 'Average',
          stream: priceRepo.averageStream,
          color: CustomColors.semaphoreOrange,
        ),
        PriceStatCard(
          title: 'Max',
          stream: priceRepo.maxPriceStream,
          color: CustomColors.semaphoreRed,
        ),
        PriceStatCard(
          title: 'Min',
          stream: priceRepo.minPriceStream,
          color: CustomColors.semaphoreGreen,
        ),
        PriceStatCard(
          title: 'Current',
          stream: priceRepo.currentPriceStream,
          color: CustomColors.current,
        ),
      ],
    );
  }
}
