import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/view/widgets/profile/dialog_edit_data.dart';

class BookDialog {

  DialogEditData dialogEditData = DialogEditData();

  void showbookdialog(
    BuildContext context,
  ){
    showDialog(
    context: context,
    builder: (context){
      return AlertDialog(

        backgroundColor: Colors.white,
    title: Center(
      child: Text(
        'طلب إشتراك في المنحة',
        style: AppText.style18w400(context),
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'الإسم')),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'العمر',)),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'رقم الهاتف',)),
          Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'الايميل')),
          Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'الكلية')),
          Container(
          margin: EdgeInsets.only(bottom: 10),
          child: EditingFeild(hint: 'المدينة'
          )),
      ],
    ),
    actions: [
        Center(
          child: Button_Sign(text: 'إرسال الطلب الان', horizontal: 20, onPress: () {
            dialogEditData.showdoneedit(context ,title: 'تم إرسال طلب الإشتراك' ,onPress: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            });
          },),
        )
    ],
  );
    }
  );
  }}