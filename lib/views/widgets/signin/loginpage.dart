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

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ApiDialog apiDialog = ApiDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // container fy tdrygt el alwan
      body: Backgoundcontainer(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(height: 70, child: Signinappbar()),
                  Container(
                    // height: 190,
                    child: BasicSignText(
                      firsttext: S.of(context).signup_button,
                      secondtext: S.of(context).signin_subtitle,
                    ),
                  ),

                  Container(
                    // height: 360,
                    child: Consumer<Control>(
                      builder: (context, value, child) {
                        return Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 20),
                                child: SignFormFeild(
                                  hint: S.of(context).name_hint,
                                  controller: value.username,
                                ),
                              ),
                              SignFormFeild(
                                hint: S.of(context).email_hint,
                                controller: value.email,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SignFormFeild(
                                  hint: S.of(context).phone_hint,
                                  controller: value.phone,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SignFormFeild(
                                  hint: S.of(context).city_hint,
                                  controller: value.city,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SignFormFeild(
                                  hint: S.of(context).password_hint,
                                  controller: value.password,
                                  onpress: () {
                                    value.isvisibliyoff();
                                  },
                                  icon: value.iconData,
                                  isPassword: value.obscure,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SignFormFeild(
                                  hint: S.of(context).confirm_password_hint,
                                  controller: value.password_confirmation,
                                  onpress: () {
                                    value.isvisibliyoff1();
                                  },
                                  icon: value.iconData1,
                                  isPassword: value.obscure1,
                                ),
                              ),
                              // Spacer(),
                              Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).width < 600
                                      ? MediaQuery.sizeOf(context).height / 4.5
                                      : MediaQuery.sizeOf(context).width < 1400
                                      ? MediaQuery.sizeOf(context).height / 1.9
                                      : MediaQuery.sizeOf(context).height / 4,
                                ),
                                // height: 40,
                                child: Button_Sign(
                                  text: S.of(context).next_button,
                                  onPress: () async {
                                    // Navigator.of(context).pushNamed('ConfirmationLogin');
                                    if (formkey.currentState!.validate()) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                      await value.Register();
                                      Navigator.of(context).pop();
                                      apiDialog.ShowApiDialog(
                                        context,
                                        title: value.isLoading
                                            ? CircularProgressIndicator()
                                            : value.register['message'],
                                        onpressed: () {
                                          if (value.check) {
                                            Navigator.of(
                                              context,
                                            ).pushNamed('ConfirmationLogin');
                                          } else {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      );
                                    }
                                  },
                                  horizontal: 30,
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
