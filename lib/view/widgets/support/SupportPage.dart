import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/view/widgets/profile/dialog_edit_data.dart';

// ignore: must_be_immutable
class SupportPage extends StatelessWidget {
  SupportPage({super.key});

  DialogEditData dialogEditData = DialogEditData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'مرحبا بك',
                  textAlign: TextAlign.center,
                  style: AppText.style18w800(context).copyWith(fontFamily: 'Almarai'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'كيف نقدر نساعدك ؟!',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppText.style18w800(context).copyWith(fontFamily: 'Almarai'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 15),
                child: Text(
                  'نرد عليك في خلال 24 ساعة !',
                  style: AppText.style14w400(context),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SignFormFeild(hint: 'أدخل رقم هاتفك'),
              ),
              SignFormFeild(hint: 'أدخل الشكوي', maxlines: 5,),
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Button_Sign(
                  
                    text: 'إرسال الشكوي', horizontal: 20, onPress: () {
                      dialogEditData.showdoneedit(context, title: 'تم إرسال  الطلب', onPress: () {
                        Navigator.of(context).pop();
                      },);
                    },
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}