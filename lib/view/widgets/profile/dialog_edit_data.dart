import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/models/Button_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class DialogEditData {

  void ShowEditData(
    BuildContext context,
  ){
    showDialog(
    context: context,
    builder: (context){
      return AlertDialog(

        backgroundColor: Colors.white,
    title: Center(
      child: Text(
        'تعديل كلمة المرور',
        style: AppText.style18w400(context),
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'كلمة المرور الحالية',)),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'كلمة المرور الجديدة',)),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'تأكيد كلمة المرور الجديدة',)),
      ],
    ),
    actions: [
        Center(
          child: Button_Sign(buttonModel: ButtonModel(text: 'حفظ كلمة المرور', horizontal: 20, onPress: () {
            showdoneedit(context ,onPress: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            });
          },)),
        )
    ],
  );
    }
  );
  }

  void showdoneedit(
  BuildContext context,
  {
    String title = 'تم التعديل بنجاح',
    VoidCallback? onPress
  }
){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: Colors.white,
    title: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 77, 235, 95),
        shape: BoxShape.circle,
        boxShadow: [
    BoxShadow(
      color: Color.fromARGB(255, 77, 235, 95).withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 6,
      offset: Offset(1, 4),
    ),
  ],
      ),
      child: Center(child: Icon(Icons.check_outlined, color: Colors.white,size: 30,))),
    content: Text(
      textAlign: TextAlign.center,
      title,
      style: AppText.style10w600(context),
    ),
    actions: [
      Center(
        child: TextButton(
          onPressed: onPress,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.Blue,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            
            child: Text(
              textAlign: TextAlign.center,
              'موافق',
              style: AppText.style8w700(context)
            ),
        )),
      )
    ],
  );
    }
  );
}
}

class EditingFeild extends StatelessWidget {
  const EditingFeild({super.key, required this.hint});
  final String hint;

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
        decoration: InputDecoration(
          filled: true,
          enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.Grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.Grey),
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