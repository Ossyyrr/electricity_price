import 'package:flutter/material.dart';

class DialogTemplate extends StatelessWidget {
  const DialogTemplate({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: child);
  }
}
