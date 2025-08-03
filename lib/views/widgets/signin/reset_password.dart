import 'package:flutter/material.dart';
import 'package:hacathon_app/components/jointed_widgets/api_dialog.dart';
import 'package:hacathon_app/components/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/components/jointed_widgets/basic_sign_text.dart';
import 'package:hacathon_app/components/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/components/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/components/jointed_widgets/signinappbar.dart';
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
                    firsttext: 'إعادة تعيين كلمة المرور',
                    secondtext: 'أدخل بياناتك لتبدء',
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
                                hint: 'الايميل',
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
                                text: 'التالي',

                                onPress: () async {
                                  if (formkey.currentState!.validate()) {
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
                                    Text("You Have an empty feild");
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
