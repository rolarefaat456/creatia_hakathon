import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class SignFormFeild extends StatelessWidget {
  const SignFormFeild({super.key, required this.hint, this.maxlines = 1});

  final String hint;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width < 600
      ? MediaQuery.sizeOf(context).width / 1.5
      : MediaQuery.sizeOf(context).width < 900
      ? MediaQuery.sizeOf(context).width / 2
      : MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextFormField(
        maxLines: maxlines,
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
          )
        ),
      ),
    );
  }
}