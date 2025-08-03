import 'package:flutter/material.dart';
import 'package:hacathon_app/components/jointed_widgets/api_dialog.dart';
import 'package:hacathon_app/components/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/components/jointed_widgets/basic_sign_text.dart';
import 'package:hacathon_app/components/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/components/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/components/jointed_widgets/signinappbar.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(height: 80, child: Signinappbar()),
                  Container(
                    child: BasicSignText(
                      firsttext: 'إنشاء كلمة مرور جديدة',
                      secondtext: '',
                    ),
                  ),

                  Container(
                    child: Consumer<Control>(
                      builder: (context, value, child) {
                        return Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 30),
                                child: SignFormFeild(
                                  hint: 'كلمة المرور الجديدة',
                                  controller: value.password,
                                  onpress: () {
                                    value.isvisibliyoff();
                                  },
                                  icon: value.iconData,
                                  isPassword: value.obscure,
                                ),
                              ),
                              SignFormFeild(
                                hint: 'كلمة المرور الجديدة',
                                controller: value.password_confirmation,
                                onpress: () {
                                  value.isvisibliyoff1();
                                },
                                icon: value.iconData1,
                                isPassword: value.obscure1,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).width < 600
                                      ? MediaQuery.sizeOf(context).height / 2.2
                                      : MediaQuery.sizeOf(context).width < 1400
                                      ? MediaQuery.sizeOf(context).height / 1.9
                                      : MediaQuery.sizeOf(context).height / 4,
                                ),
                                child: Button_Sign(
                                  text: 'تسجيل الدخول',
                                  onPress: () async {
                                    if (formkey.currentState!.validate()) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                      await value.Reset();
                                      Navigator.of(context).pop();
                                      apiDialog.ShowApiDialog(
                                        context,
                                        title: value.reset['message'],
                                        onpressed: () {
                                          if (value.check) {
                                            Navigator.of(
                                              context,
                                            ).pushNamed('SigninPage');
                                          } else {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      );
                                    } else {
                                      Text("You Have an empty feild");
                                    }
                                  },
                                  horizontal: 10,
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
      ),
    );
  }
}
