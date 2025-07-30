import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/sign_text_model.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class ConfirmationLoginText extends StatelessWidget {
  const ConfirmationLoginText({super.key, required this.signTextModel});

  final SignTextModel signTextModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              signTextModel.firsttext,
              style: AppText.style24w800(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              signTextModel.secondtext,
              style: AppText.style12w700(context),
            ),
          ),
        ],
      ),
    );
  }
}