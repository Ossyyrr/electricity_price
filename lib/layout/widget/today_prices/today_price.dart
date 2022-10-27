import 'package:electricity_price/core/model/price_model.dart';
import 'package:electricity_price/layout/utils/price_utils.dart';
import 'package:flutter/material.dart';

class TodayPrice extends StatefulWidget {
  const TodayPrice({super.key, required this.price});
  final Price price;

  @override
  State<TodayPrice> createState() => _TodayPriceState();
}

class _TodayPriceState extends State<TodayPrice> {
  bool showArrowInfo = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            children: [
              const SizedBox(width: 24),
              SizedBox(
                  width: 80,
                  child: Text(
                    widget.price.hour.toString(),
                    style: const TextStyle(fontSize: 16),
                  )),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      widget.price.price.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.price.units),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              IconButton(
                onPressed: () => setState(() => showArrowInfo = true),
                icon: Icon(
                  widget.price.isCheap! ? Icons.trending_down : Icons.trending_up,
                  color: PriceUtils.getPriceColor(widget.price),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => showArrowInfo = false),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              color: Colors.blue,
              width: showArrowInfo ? 150 : 0,
              height: 50,
              child: PriceUtils.getPriceCaption(widget.price)),
        ),
      ],
    );
  }
}
