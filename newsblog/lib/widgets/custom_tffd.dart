import 'package:flutter/material.dart';
import 'package:newsblog/consts/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    Key? key,
    this.hinttext,
    this.textInputAction,
    this.textInputType,
    this.textEditingController,
    this.obscureText = false,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  String? hinttext;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  TextEditingController? textEditingController;
  bool? obscureText;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      toolbarOptions: const ToolbarOptions(
          copy: true, paste: true, selectAll: true, cut: true),
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText!,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: black700),
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(color: fieldTextinput),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
