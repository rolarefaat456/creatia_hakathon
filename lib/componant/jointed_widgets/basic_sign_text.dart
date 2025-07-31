import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class BasicSignText extends StatelessWidget {
  const BasicSignText({super.key, required this.firsttext, required this.secondtext, });

  final String firsttext, secondtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              firsttext,
              style: AppText.style24w800(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              secondtext,
              style: AppText.style16w400(context),
            ),
          ),
        ],
      ),
    );
  }
}