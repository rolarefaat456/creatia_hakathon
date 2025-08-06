import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacathon_app/components/widgets/Confirmation_Login_text.dart';
import 'package:hacathon_app/components/widgets/api_dialog.dart';
import 'package:hacathon_app/components/widgets/backgoundcontainer.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/widgets/confirmation_code.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/components/widgets/signinappbar.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class EnterConfirmationPassword extends StatefulWidget {
  const EnterConfirmationPassword({super.key});

  @override
  State<EnterConfirmationPassword> createState() =>
      _EnterConfirmationPasswordState();
}

class _EnterConfirmationPasswordState extends State<EnterConfirmationPassword> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ApiDialog apiDialog = ApiDialog();
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
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(height: 70, child: Signinappbar()),
                  Container(
                    child: ConfirmationLoginText(
                      firsttext: S.of(context).reset_password_title,
                      secondtext: S.of(context).verify_subtitle,
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
                                height: 130,
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
                            S.of(context).resend_code,
                            style: AppText.style10w600(context).copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.Volit_Blue,
                              color: AppColors.Volit_Blue,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        );
                      },
                    ),
                  ),
                            // Spacer(),
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).width < 600
                                    ? MediaQuery.sizeOf(context).height / 3.1
                                    : MediaQuery.sizeOf(context).width < 1400
                                    ? MediaQuery.sizeOf(context).height / 1.9
                                    : MediaQuery.sizeOf(context).height / 4,
                              ),
                              height: 40,
                              child: Button_Sign(
                                text: S.of(context).next_button,

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
                                    if (value.check) {
                                      apiDialog.ShowApiDialog(
                                      context,
                                      title: value.vertfy['message'],
                                      onpressed: () {
                                          Navigator.of(
                                            context,
                                          ).pushNamed('CreateNewPassword');
                                        }
                                        );
                                    }else{
                                      apiDialog.ShowApiDialog(
                                      context,
                                      title: value.vertfy['message'],
                                      onpressed: () {
                                        Navigator.of(context).pop();
                                        });
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          S.of(context).empty_field_message,
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
