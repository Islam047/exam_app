import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  final String text;
  const TabItems({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
