import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/components/widgets/api_dialog.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/widgets/sign_form_feild.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/profile/dialog_edit_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SupportPage extends StatelessWidget {
  SupportPage({super.key});

  DialogEditData dialogEditData = DialogEditData();
  GlobalKey<FormState> formkey = GlobalKey();
  ApiDialog apiDialog = ApiDialog();

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
                  S.of(context).welcome,
                  textAlign: TextAlign.center,
                  style: AppText.style18w800(
                    context,
                  ).copyWith(fontFamily: 'Almarai'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  S.of(context).how_can_we_help,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppText.style18w800(
                    context,
                  ).copyWith(fontFamily: 'Almarai'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 15),
                child: Text(
                  S.of(context).reply_within_24_hours,
                  style: AppText.style14w400(context),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              Consumer<Control>(
                builder: (context, value, child) {
                  return Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SignFormFeild(
                            hint: S.of(context).enter_phone,
                            controller: value.phone,
                          ),
                        ),
                        SignFormFeild(
                          hint: S.of(context).enter_complaint,
                          maxlines: 5,
                          controller: value.message,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          child: Button_Sign(
                            text: S.of(context).send_complaint,
                            horizontal: 20,
                            onPress: () async {
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                                await value.AddComplain();
                                Navigator.of(context).pop();
                                apiDialog.ShowApiDialog(
                                  context,
                                  title: value.addComplain['message'],
                                  onpressed: () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
