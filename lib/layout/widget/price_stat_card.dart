import 'package:electricity_price/core/model/price_model.dart';
import 'package:flutter/material.dart';

class PriceStatCard extends StatelessWidget {
  const PriceStatCard({
    Key? key,
    required this.title,
    required this.stream,
    required this.color,

    // que necesita para valer para todo?
  }) : super(key: key);
  final String title;
  final Stream<Price> stream;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 2.5,
      height: 70,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Text(title),
              )),
          StreamBuilder<Price>(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${snapshot.data!.price} ',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        TextSpan(text: snapshot.data!.units),
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
