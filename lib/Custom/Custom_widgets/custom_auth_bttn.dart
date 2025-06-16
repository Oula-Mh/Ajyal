import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAuthBttn extends StatelessWidget {
  final VoidCallback onPressed;
  final String bttnText;
  const CustomAuthBttn({
    super.key,
    required this.onPressed,
    required this.bttnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF365EB1), // الأزرق الفاتح
            Color(0xFF17284B), // الأزرق الداكن
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(bttnText, style: Styles.meduimWhite),
      ),
    );
  }
}
