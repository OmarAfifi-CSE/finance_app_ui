import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_colors.dart';
import '../styling/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.width,
    this.height,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    // Initialize the internal state from the widget's property
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 331.w,
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp),
        controller: widget.controller,
        validator: widget.validator,
        cursorColor: AppColors.primaryColor,
        obscureText: _isObscured,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: AppStyles.textFieldTextStyle,
          filled: true,
          fillColor: AppColors.textFieldColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffE8ECF4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red.shade400),
          ),
          suffixIcon: widget.obscureText
              ? _buildPasswordIcon()
              : widget.suffixIcon,
        ),
      ),
    );
  }

  Widget _buildPasswordIcon() {
    return IconButton(
      icon: Icon(
        _isObscured ? Icons.visibility_off : Icons.visibility,
        color: AppColors.grayColor,
      ),
      onPressed: () {
        setState(() {
          _isObscured = !_isObscured;
        });
      },
    );
  }
}
