import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/api_dialog.dart';
import 'package:hacathon_app/components/widgets/backgoundcontainer.dart';
import 'package:hacathon_app/components/widgets/basic_sign_text.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/widgets/sign_form_feild.dart';
import 'package:hacathon_app/components/widgets/signinappbar.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ApiDialog apiDialog = ApiDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Backgoundcontainer(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: Column(
              children: [
                Container(height: 70, child: Signinappbar()),
                Container(
                  // height: 190,
                  child: BasicSignText(
                    firsttext: S.of(context).reset_password_title,
                    secondtext: S.of(context).signin_subtitle,
                  ),
                ),

                Container(
                  // height: 350,
                  child: Consumer<Control>(
                    builder: (context, value, child) {
                      return Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20, top: 30),
                              child: SignFormFeild(
                                hint: S.of(context).email_hint,
                                controller: value.email,
                              ),
                            ),
                            // Spacer(),
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).width < 600
                                    ? MediaQuery.sizeOf(context).height / 2.1
                                    : MediaQuery.sizeOf(context).width < 1400
                                    ? MediaQuery.sizeOf(context).height / 1.9
                                    : MediaQuery.sizeOf(context).height / 4,
                              ),
                              // height: 50,
                              child: Button_Sign(
                                text: S.of(context).reset_password_title,

                                onPress: () async {
                                  if (formkey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                    await value.ForgetPassword();
                                    Navigator.of(context).pop();
                                    apiDialog.ShowApiDialog(
                                      context,
                                      title: value.forgetPassword['message'],
                                      onpressed: () {
                                        if (value.check) {
                                          Navigator.of(context).pushNamed(
                                            'EnterConfirmationPassword',
                                          );
                                        } else {
                                          Navigator.of(context).pop();
                                        }
                                      },
                                    );
                                  } else {
                                    Text(
                                      S.of(context).empty_field_message
                                    );
                                  }
                                },
                                horizontal: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
