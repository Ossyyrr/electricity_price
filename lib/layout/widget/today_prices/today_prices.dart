import 'package:electricity_price/core/model/price_model.dart';
import 'package:electricity_price/core/repository/price_repository.dart';
import 'package:electricity_price/layout/widget/today_prices/caption.dart';
import 'package:electricity_price/layout/widget/today_prices/today_price.dart';
import 'package:flutter/material.dart';

class TodayPrices extends StatelessWidget {
  const TodayPrices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceRepo = PricesRepository();

    return Column(
      children: [
        const Caption(),
        const SizedBox(height: 16),
        Expanded(
          child: StreamBuilder<List<Price>>(
              stream: priceRepo.pricesStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final prices = snapshot.data!;
                  return ListView.builder(
                    itemCount: prices.length,
                    itemBuilder: (context, index) {
                      return TodayPrice(price: prices[index]);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
