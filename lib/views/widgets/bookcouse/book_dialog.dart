import 'package:flutter/material.dart';
import 'package:hacathon_app/components/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/profile/dialog_edit_data.dart';
import 'package:provider/provider.dart';

class BookDialog {
  DialogEditData dialogEditData = DialogEditData();

  void showbookdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'طلب إشتراك في المنحة',
              style: AppText.style18w400(context),
            ),
          ),
          content: Consumer<Control>(
            builder: (context, value, child) {
              return Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: EditingFeild(
                        hint: 'الإسم',
                        nameController: value.username,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: EditingFeild(
                        hint: 'العمر',
                        nameController: value.age,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: EditingFeild(
                        hint: 'رقم الهاتف',
                        nameController: value.phone,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: EditingFeild(
                        hint: 'الايميل',
                        nameController: value.email,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: EditingFeild(
                        hint: 'الكلية',
                        nameController: value.college,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: EditingFeild(
                        hint: 'المدينة',
                        nameController: value.city,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Consumer<Control>(
              builder: (context, value, child) {
                return Center(
                  child: Button_Sign(
                    text: 'إرسال الطلب الان',
                    horizontal: 20,
                    onPress: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            Center(child: CircularProgressIndicator()),
                      );
                      await value.ReqeustBook();
                      Navigator.of(context).pop();
                      dialogEditData.showdoneedit(
                        context,
                        onPress: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        success: true,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
