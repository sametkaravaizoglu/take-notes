import 'package:flutter/material.dart';
import 'package:note_app/core/init/color/color_manager.dart';

class PTextField {
  static final PTextField _instance = PTextField._init();
  static PTextField get instance => _instance;
  PTextField._init();

  Widget widget({
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    Widget? label,
    int? minLines,
    maxLines,
  }) {
    TextFormField textFormField = TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorStyle: TextStyle(
          color: ColorManager.instance.redColor,
          fontSize: 14,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.instance.redColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.instance.redColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.instance.softGray),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.instance.softGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.instance.softGray),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.instance.softGray),
        ),
        fillColor: ColorManager.instance.white,
        label: label,
      ),
      minLines: minLines ?? 1,
      maxLines: maxLines,
      validator: validator,
    );
    return textFormField;
  }
}
