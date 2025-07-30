
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/Button_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class Button_Sign extends StatelessWidget {

  final ButtonModel buttonModel;

  const Button_Sign({super.key, required this.buttonModel });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonModel.color,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // هنا بتغيري الـ radius
        ),
      ),
      
      onPressed: buttonModel.onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: buttonModel.horizontal ),
        child: Text(
          buttonModel.text,
          style: AppText.style12w400(context).copyWith(color: buttonModel.textcolor),
        ),
      )
    );
  }
}