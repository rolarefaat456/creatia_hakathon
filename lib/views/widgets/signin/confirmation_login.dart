import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacathon_app/components/jointed_widgets/Confirmation_Login_text.dart';
import 'package:hacathon_app/components/jointed_widgets/api_dialog.dart';
import 'package:hacathon_app/components/jointed_widgets/backgoundcontainer.dart';
import 'package:hacathon_app/components/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/components/jointed_widgets/confirmation_code.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/components/jointed_widgets/signinappbar.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class ConfirmationLogin extends StatefulWidget {
  const ConfirmationLogin({super.key});

  @override
  State<ConfirmationLogin> createState() => _ConfirmationLoginState();
}

class _ConfirmationLoginState extends State<ConfirmationLogin> {
  late List<FocusNode> focusNodes;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ApiDialog apiDialog = ApiDialog();

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
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(height: 80, child: Signinappbar()),
                  Container(
                    // height: 190,
                    child: ConfirmationLoginText(
                      firsttext: 'إنشاء حساب جديد',
                      secondtext: 'قم بإدخال رقم التأكيد الخاص بك',
                    ),
                  ),

                  Consumer<Control>(
                    builder: (context, value, child) {
                      return Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                height: 150,
                                width: 250,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: ConfimationCode(
                                  focusNodes: focusNodes,
                                  opts: value.opts,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(50),
                              child: Consumer<Control>(
                                builder: (context, value, child) {
                                  return InkWell(
                                    onTap: () async {
                                      await value.ResendCode();
                                    },
                                    child: Text(
                                      'إعادة إرسال الكود !',
                                      style: AppText.style10w600(context)
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                AppColors.Volit_Blue,
                                            color: AppColors.Volit_Blue,
                                          ),
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).width < 600
                                    ? MediaQuery.sizeOf(context).height / 4.5
                                    : MediaQuery.sizeOf(context).width < 1400
                                    ? MediaQuery.sizeOf(context).height / 1.9
                                    : MediaQuery.sizeOf(context).height / 4,
                              ),
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
                                    await value.Verify();
                                    Navigator.of(context).pop();
                                    apiDialog.ShowApiDialog(
                                      context,
                                      title: value.vertfy['message'],
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "You have an empty field",
                                        ),
                                      ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
