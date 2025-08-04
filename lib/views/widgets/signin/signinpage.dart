import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/api_dialog.dart';
import 'package:hacathon_app/components/widgets/backgoundcontainer.dart';
import 'package:hacathon_app/components/widgets/basic_sign_text.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/widgets/sign_form_feild.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/components/widgets/signinappbar.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ApiDialog apiDialog = ApiDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تدريج اللون
      body: Backgoundcontainer(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: Column(
              children: [
                // الاب بار
                Container(height: 80, child: Signinappbar()),
                Container(
                  child: BasicSignText(
                    firsttext: S.of(context).signin_title,
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
                              padding: EdgeInsets.only(bottom: 10, top: 30),
                              child: SignFormFeild(
                                hint: S.of(context).email_hint,
                                controller: value.email,
                              ),
                            ),
                            SignFormFeild(
                              hint: S.of(context).password_hint,
                              controller: value.password,
                              onpress: () {
                                value.isvisibliyoff();
                              },
                              icon: value.iconData,
                              isPassword: value.obscure,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Consumer<Control>(
                                builder: (context, value, child) {
                                  return InkWell(
                                    onTap: () async {
                                      Navigator.of(
                                        context,
                                      ).pushNamed('ResetPassword');
                                      // await value.ForgetPassword();
                                    },
                                    child: Text(
                                      S.of(context).forgot_password,
                                      style: AppText.style10w600(context)
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: AppColors.Blue,
                                            color: AppColors.Blue,
                                          ),
                                      // textDirection: TextDirection.rtl,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).width < 600
                                    ? MediaQuery.sizeOf(context).height / 3.2
                                    : MediaQuery.sizeOf(context).width < 1400
                                    ? MediaQuery.sizeOf(context).height / 1.9
                                    : MediaQuery.sizeOf(context).height / 4,
                              ),
                              child: Container(
                                child: Button_Sign(
                                  text: S.of(context).signin_title,
                                  onPress: () async {
                                    if (formkey.currentState!.validate()) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                      await value.Login();
                                      Navigator.of(context).pop();
                                      apiDialog.ShowApiDialog(
                                        context,
                                        title: value.login['message'],
                                        onpressed: () {
                                          if (value.check) {
                                            Navigator.of(
                                              context,
                                            ).pushNamed('ViewPage');
                                          } else {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      );
                                    }
                                  },
                                  horizontal: 90,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Button_Sign(
                                text: S.of(context).signup_button,
                                onPress: () {
                                  Navigator.of(context).pushNamed('Login');
                                },
                                color: Colors.white,
                                horizontal: value.isArabic()?85 : 55,
                                textcolor: AppColors.Blue,
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
