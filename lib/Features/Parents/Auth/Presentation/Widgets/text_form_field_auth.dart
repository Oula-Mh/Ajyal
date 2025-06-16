import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldAuth extends StatefulWidget {
  final String baseText;
  final String hintText;
  final IconData? iconData;
  final bool isNumber;
  final bool? isPassword;
  bool? passToggle;
  // final String? Function(String?)? validator;
  final TextEditingController? mycontroller;

  TextFormFieldAuth({
    super.key,
    required this.baseText,
    required this.hintText,
    @required this.iconData,
    required this.isNumber,
    this.isPassword = false,
    this.passToggle,
    // this.validator
    this.mycontroller,
  });
  // const TextFormFieldAuth({super.key});

  @override
  State<TextFormFieldAuth> createState() => _TextFormFieldAuthState();
}

class _TextFormFieldAuthState extends State<TextFormFieldAuth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.baseText),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.mycontroller,
          // validator:widget.validator,
          keyboardType: widget.isNumber ? TextInputType.number : null,
          obscureText:
              widget.passToggle! || widget.passToggle == true ? true : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF3F8FF),
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 35,
            ),
            suffixIcon:
                widget.isPassword == true
                    ? InkWell(
                      onTap: () {
                        setState(() {
                          widget.passToggle =
                              widget.passToggle == true ? false : true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          widget.passToggle!
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFFA38097),
                        ),
                      ),
                    )
                    : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(widget.iconData, color: Color(0xFFA38097)),
            ),
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
