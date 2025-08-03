import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class SignFormFeild extends StatelessWidget {
  SignFormFeild({
    super.key,
    required this.hint,
    this.maxlines = 1,
    required this.controller,
    this.icon,
    this.onpress,
    this.isPassword = false,
  });

  final String hint;
  final int maxlines;
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback? onpress;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width < 600
          ? MediaQuery.sizeOf(context).width / 1.5
          : MediaQuery.sizeOf(context).width < 900
          ? MediaQuery.sizeOf(context).width / 2
          : MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        maxLines: maxlines,
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'هذا الحقل مطلوب';
          }return null;},
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          hint: Text(
            hint,
            style: AppText.style11w500(context),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
          prefixIcon: icon != null ? IconButton(onPressed: onpress, icon: Icon(icon, color: AppColors.Grey,)): null,
        ),
      ),
    );
  }
}
