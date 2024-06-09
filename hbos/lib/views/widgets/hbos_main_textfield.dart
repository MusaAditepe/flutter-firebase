import 'package:flutter/material.dart';

class HbosMainTextField extends StatelessWidget {
  final String? text;
  final bool? obscureText;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  const HbosMainTextField(
      {super.key,
      this.text,
      this.obscureText,
      this.icon,
      this.textInputType,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obscureText!,
      textInputAction: TextInputAction.next,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
        fillColor: Colors.grey.shade100,
        prefixIcon: Icon(
          icon!,
          size: 13,
        ),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? Colors.green
                : Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.1), width: .5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.1), width: .5),
        ),
        hintText: text,
      ),
    );
  }
}
