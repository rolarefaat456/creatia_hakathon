import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class ApiDialog {

  void ShowApiDialog(
    BuildContext context,
    {required dynamic title, required VoidCallback onpressed}
  )
  {
    final prov = Provider.of<Control>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: prov.check? Icon(Icons.check_circle_outline_rounded, color: AppColors.Dark_Green, size: 50,)
          :Icon(Icons.cancel_outlined, color: Colors.red, size: 50,),

          content: Text(
  title is List ? title.join('\n') : title.toString(),
            style: AppText.style14w400(context).copyWith(color: AppColors.Black),
            textAlign: TextAlign.center,
          ),

          actions: [
            TextButton(
              onPressed: onpressed,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.Blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'تم',
                    style: AppText.style10w500(context),
                  ),
                ),
              )
            )
          ],
        );
      },
    );
  }
}