import 'package:electricity_price/core/model/price_model.dart';
import 'package:electricity_price/core/repository/price_repository.dart';
import 'package:electricity_price/layout/utils/custom_colors.dart';
import 'package:electricity_price/layout/widget/today_prices/caption.dart';
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
                      return Container(
                        height: 40,
                        color: CustomColors.getPriceColor(prices[index]),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 80,
                                child: Text(
                                  prices[index].hour.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                            Text(
                              prices[index].price.toString(),
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(prices[index].units),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ],
    );
  }
}
