import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class ItemAnalysSelection extends StatelessWidget {
  final String selectItemName;
  const ItemAnalysSelection({super.key, required this.selectItemName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            selectItemName,
            style: TextStyle(
              color: AppColor.borderTextField,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
