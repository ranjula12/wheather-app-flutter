import 'package:flutter/material.dart';

class CustomRow extends StatefulWidget {
  const CustomRow({super.key, required this.title});
  final String title;

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withAlpha(80)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title),
          )
        ],
      ),
    );
  }
}
