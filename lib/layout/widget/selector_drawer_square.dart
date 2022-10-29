import 'package:flutter/material.dart';

enum SelectorDrawerType { list, graph }

class SelectorDrawerSquare extends StatelessWidget {
  const SelectorDrawerSquare({
    Key? key,
    required this.page,
    this.onTap,
  }) : super(key: key);
  final SelectorDrawerType page;
  final void Function(SelectorDrawerType page)? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          width: 300,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: page == SelectorDrawerType.list ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
              margin: const EdgeInsets.all(1),
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap?.call(SelectorDrawerType.list),
              child: Container(
                color: Colors.transparent,
                width: 150,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Lista',
                  style: TextStyle(
                      color: page == SelectorDrawerType.list ? Colors.white : Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onTap?.call(SelectorDrawerType.graph),
              child: Container(
                color: Colors.transparent,
                width: 150,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Gráfico',
                  style: TextStyle(
                      color: page == SelectorDrawerType.graph ? Colors.white : Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
