import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/componant/jointed_widgets/basic_sign_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/componant/models/Button_model.dart';
import 'package:hacathon_app/componant/models/sign_text_model.dart';
import 'package:hacathon_app/componant/jointed_widgets/signinappbar.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
                  // Expanded
                  Container (
                    height: 80,
                    child: Signinappbar()
                  ),
                  Container(
                    // height: 190,
                    child: BasicSignText(signTextModel: SignTextModel( firsttext: 'إنشاء كلمة مرور جديدة', secondtext: '')),
                  ),
                  Container(
                    // height: 350,
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 30),
                            child: SignFormFeild(hint: 'كلمة المرور الجديدة'),
                          ),
                          SignFormFeild(hint: 'كلمة المرور الجديدة'),
                        ],
                      ),
                    )
                  ),
                  Spacer(),
                  Container(
                    // height: 50,
                    margin: EdgeInsets.only(bottom: 40),
                    child: Button_Sign(buttonModel: ButtonModel(text: 'تسجيل الدخول', onPress: () {
                      Navigator.of(context).pushNamed('ViewPage');
                    },horizontal: 10
                    )
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