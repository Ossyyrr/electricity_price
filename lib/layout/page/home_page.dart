import 'package:electricity_price/layout/widget/price_stats_cards.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
// Un appbar con la fecha de hoy
//Debajo una lista de precios, una tabla
//debajo el máximo minimo media y current

    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: PriceStatsCards(),
        ),
      ),
    );
  }
}
