import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/componant/jointed_widgets/basic_sign_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/signinappbar.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
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
                  // Expanded
                  Container(height: 80, child: Signinappbar()),
                  Container(
                    // height: 190,
                    child: BasicSignText(
                      firsttext: 'تسجيل الدخول',
                      secondtext: 'أدخل بياناتك لتبدء',
                    ),
                  ),

                  Container(
                    // height: 350,
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 30),
                            child: SignFormFeild(hint: 'الايميل'),
                          ),
                          SignFormFeild(hint: 'كلمة المرور'),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed('ResetPassword');
                              },
                              child: Text(
                                'هل نسيت كلمة المرور',
                                style: AppText.style10w600(context).copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.Blue,
                                  color: AppColors.Blue,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // height: 50,
                          child: Button_Sign(
                            text: 'تسجيل الدخول',
                            onPress: () {
                              Navigator.of(context).pushNamed('ViewPage');
                            },
                            color: Colors.white,
                            horizontal: 20,
                            textcolor: AppColors.Blue,
                          ),
                        ),
                        Container(
                          // height: 50,
                          child: Button_Sign(
                            text: 'إنشاء حساب جديد',
                            onPress: () {
                              Navigator.of(context).pushNamed('Login');
                            },
                            horizontal: 10,
                          ),
                        ),
                      ],
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
