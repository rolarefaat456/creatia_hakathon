import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacathon_app/componant/jointed_widgets/Confirmation_Login_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/componant/jointed_widgets/basic_sign_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/jointed_widgets/confirmation_code.dart';
import 'package:hacathon_app/componant/jointed_widgets/sign_form_feild.dart';
import 'package:hacathon_app/componant/models/Button_model.dart';
import 'package:hacathon_app/componant/models/sign_text_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/componant/jointed_widgets/signinappbar.dart';

class ConfirmationLogin extends StatefulWidget {
  const ConfirmationLogin({super.key});

  @override
  State<ConfirmationLogin> createState() => _ConfirmationLoginState();
}

class _ConfirmationLoginState extends State<ConfirmationLogin> {
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (_) => FocusNode());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // container fy tdrygt el alwan
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
                    height: 80,
                    child: Signinappbar()
                  ),
                  Container(
                    // height: 190,
                    child: ConfirmationLoginText(signTextModel: SignTextModel(firsttext: 'إنشاء حساب جديد', secondtext: 'قم بإدخال رقم التأكيد الخاص بك')),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      width: 250,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ConfimationCode(focusNodes: focusNodes),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      'إعادة إرسال الكود !',
                      style: AppText.style10w600(context).copyWith(decoration: TextDecoration.underline, decorationColor: AppColors.Volit_Blue, color: AppColors.Volit_Blue),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    // height: 40,
                    child: Button_Sign(buttonModel: ButtonModel(text: 'التالي', onPress: () {
                      Navigator.of(context).pushNamed('SigninPage');
                    },
                    horizontal: 30
                    )),
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
