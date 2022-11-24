import 'package:flutter/material.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      color: Colors.blue.shade100,
      height: 100,
      child: const Center(
          child: Text(
        "List Item",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
      )),
    );
  }
}
