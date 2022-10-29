import 'package:electricity_price/core/repository/price_repository.dart';
import 'package:electricity_price/layout/utils/extensions/datetime_extension.dart';
import 'package:electricity_price/layout/widget/info/info.dart';
import 'package:electricity_price/layout/widget/price_stats_cards.dart';
import 'package:electricity_price/layout/widget/selector_drawer_square.dart';
import 'package:electricity_price/layout/widget/today_prices/today_prices.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SelectorDrawerType page = SelectorDrawerType.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Precios de la luz'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => PricesRepository().init(),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () => Info.showInfoDialog(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  DateTime.now().date().toString().substring(0, 10),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SelectorDrawerSquare(
                page: page,
                onTap: (p) => setState(() => page = p),
              ),
              Expanded(
                child: page == SelectorDrawerType.list ? const TodayPrices() : const Text('graph'),
              ),
              const PriceStatsCards(),
            ],
          ),
        ),
      ),
    );
  }
}
