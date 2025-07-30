import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/componant/jointed_widgets/basic_sign_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/componant/models/Button_model.dart';
import 'package:hacathon_app/componant/models/sign_text_model.dart';
import 'package:hacathon_app/componant/jointed_widgets/signinappbar.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Backgoundcontainer(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container (
                    height: 70,
                    child: Signinappbar()
                  ),
                  Container(
                    // height: 190,
                    child: BasicSignText(signTextModel: SignTextModel( firsttext: 'إعادة تعيين كلمة المرور', secondtext: 'أدخل بياناتك لتبدء')),
                  ),
                  Container(
                    // height: 350,
                    child: Form(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 30),
                        child: SignFormFeild(hint: 'الايميل'),
                      ),
                    )
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    // height: 50,
                    child: Button_Sign(buttonModel: ButtonModel(text: 'التالي', onPress: () {
                      Navigator.of(context).pushNamed('EnterConfirmationPassword');
                    },
                    horizontal: 20,
                    )),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}