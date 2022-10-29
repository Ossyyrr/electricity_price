import 'package:electricity_price/layout/utils/custom_colors.dart';
import 'package:electricity_price/layout/widget/dialog_template.dart';
import 'package:electricity_price/layout/widget/info/info_card.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  static Future<void> showInfoDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DialogTemplate(
            child: Info(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Información horarios',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          InfoCard(
            color: CustomColors.semaphoreRed,
            title: 'Punta',
            code: 'P1',
            infoPrice: 'La más cara',
            description: 'De 10:00 a 14:00 y de 18:00 a 22:00',
          ),
          InfoCard(
            color: CustomColors.semaphoreOrange,
            title: 'Llana',
            code: 'P2',
            infoPrice: 'Precio medio',
            description: 'De 8:00 a 10:00 y de 14:00 a 18:00',
          ),
          InfoCard(
            color: CustomColors.semaphoreGreen,
            title: 'Valle',
            code: 'P3',
            infoPrice: 'La más barata',
            description: 'De 00:00 a 8:00, fines de semana y festivos',
          ),
        ],
      ),
    );
  }
}
