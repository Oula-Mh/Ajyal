import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ArrowNextPre extends StatefulWidget {
  ArrowNextPre({
    required this.color,
    required this.icon,
    this.onTap,
    super.key,
  });
  void Function()? onTap;
  Color color;
  IconData icon;
  @override
  State<ArrowNextPre> createState() => _ArrowNextPreState();
}

class _ArrowNextPreState extends State<ArrowNextPre> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        color: widget.color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
          child: Icon(widget.icon, color: Colors.white),
        ),
      ),
    );
  }
}
