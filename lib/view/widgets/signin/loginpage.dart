import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/componant/jointed_widgets/basic_sign_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/componant/jointed_widgets/signinappbar.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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
                      firsttext: 'إنشاء حساب جديد',
                      secondtext: 'أدخل بياناتك لتبدء',
                    ),
                  ),

                  Container(
                    // height: 360,
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5, top: 20),
                            child: SignFormFeild(hint: 'الإسم'),
                          ),
                          SignFormFeild(hint: 'الايميل'),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SignFormFeild(hint: 'رقم الهاتف'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SignFormFeild(hint: 'المدينة'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SignFormFeild(hint: 'كلمة المرور'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SignFormFeild(hint: 'تأكيد كلمة المرور'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    // height: 40,
                    child: Button_Sign(
                      text: 'التالي',
                      onPress: () {
                        Navigator.of(context).pushNamed('ConfirmationLogin');
                      },
                      horizontal: 30,
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
