import 'package:flutter/material.dart';

class CustomRowInfo extends StatelessWidget {
  final String title;
  final String info;
  const CustomRowInfo({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          Text(
            info,
            style: TextStyle(fontSize: 18, color: Colors.white60, height: 1.5),
          ),
        ],
      ),
    );
  }
}
