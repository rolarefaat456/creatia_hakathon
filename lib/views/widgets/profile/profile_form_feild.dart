import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class ProfileFormFeild extends StatelessWidget {
  ProfileFormFeild({super.key, required this.hint, required this.readonly, required this.enable, required this.colortext, this.onpress, required this.nameController});

  final String hint;
  final bool readonly, enable;
  final Color colortext;
  final VoidCallback ?onpress;
  final TextEditingController ?nameController;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width < 600
      ? MediaQuery.sizeOf(context).width / 1.2
      : MediaQuery.sizeOf(context).width < 900
      ? MediaQuery.sizeOf(context).width / 2
      : MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextFormField(
        onTap: onpress,
        controller: nameController,
        style: AppText.style12w500(context).copyWith(color: colortext ),
        enabled: enable,
        readOnly: readonly,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
          fillColor: Colors.white,
          suffix: Text(
            hint,
            style: AppText.style12w500(context).copyWith(color: AppColors.Black),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
