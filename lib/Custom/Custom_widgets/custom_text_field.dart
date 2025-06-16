import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  // final String? hint;
  final TextEditingController controller;
  final IconData? icon;
  final bool? isPassword;
  final TextInputType keyboardType;
  final bool? obscureText;
  bool? passToggle;

  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.controller,
    this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.validator,
    required this.keyboardType,
    this.passToggle = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText:
          widget.passToggle! || widget.passToggle == true ? true : false,
      validator: widget.validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderTextField, width: 0.77),
          borderRadius: BorderRadius.circular(7.69),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.77),
          borderRadius: BorderRadius.circular(7.69),
        ),
        filled: true,
        fillColor: AppColor.fillTextField,
        prefixIcon:
            widget.icon != null
                ? Icon(widget.icon, color: Color(0xFFA38097))
                : null,
        suffixIcon:
            widget.isPassword == true
                ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.passToggle =
                          widget.passToggle == true ? false : true;
                    });
                  },
                  child: Icon(
                    widget.passToggle!
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Color(0xFFA38097),
                  ),
                )
                : null,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.69)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
      ),
    );
  }
}
