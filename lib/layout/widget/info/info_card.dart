import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.color,
    required this.title,
    required this.code,
    required this.infoPrice,
    required this.description,
  }) : super(key: key);
  final Color color;
  final String title;
  final String code;
  final String infoPrice;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Text(
                  code,
                  style: const TextStyle(fontSize: 14),
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Text(infoPrice),
                ),
                const SizedBox(width: 16),
                Expanded(child: Text(description)),
              ],
            ),
          ],
        ));
  }
}
