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

/// صفحة تأكيد الدخول بكود تحقق مكون من 4 خانات
class ConfirmationLogin extends StatefulWidget {
  const ConfirmationLogin({super.key});

  @override
  State<ConfirmationLogin> createState() => _ConfirmationLoginState();
}

class _ConfirmationLoginState extends State<ConfirmationLogin> {
  late List<FocusNode> focusNodes; // قائمة لعناصر التحكم في التركيز بين خانات الكود
  GlobalKey<FormState> formkey = GlobalKey<FormState>(); // مفتاح النموذج للتحقق من صحته
  ApiDialog apiDialog = ApiDialog(); // لعرض الحوارات بعد التحقق

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (_) => FocusNode()); // إنشاء 4 عناصر تركيز (لكود مكون من 4 خانات)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الخلفية تحتوي على تدرج أو تصميم ثابت
      body: Backgoundcontainer(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // شريط علوي مخصص لتسجيل الدخول
                  Container(height: 80, child: Signinappbar()),

                  // نصوص العنوان والوصف (مرحبا - الرجاء إدخال الكود)
                  Container(
                    child: ConfirmationLoginText(
                      firsttext: S.of(context).signup_button,
                      secondtext: S.of(context).verify_subtitle,
                    ),
                  ),

                  // النموذج الخاص بإدخال كود التحقق
                  Consumer<Control>(
                    builder: (context, value, child) {
                      return Form(
                        key: formkey,
                        child: Column(
                          children: [
                            // مربعات إدخال الكود الأربعة
                            Center(
                              child: Container(
                                height: 150,
                                width: 250,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: ConfimationCode(
                                  focusNodes: focusNodes, // تمرير التركيز لكل خانة
                                  opts: value.opts,       // خيارات الإدخال (controllers)
                                ),
                              ),
                            ),

                            // رابط إعادة إرسال الكود
                            Padding(
                              padding: const EdgeInsets.all(50),
                              child: Consumer<Control>(
                                builder: (context, value, child) {
                                  return InkWell(
                                    onTap: () async {
                                      await value.ResendCode(); // إعادة إرسال الكود
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

                            // زر التالي
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).width < 600
                                    ? MediaQuery.sizeOf(context).height / 4.5
                                    : MediaQuery.sizeOf(context).width < 1400
                                        ? MediaQuery.sizeOf(context).height / 1.9
                                        : MediaQuery.sizeOf(context).height / 4,
                              ),
                              child: Button_Sign(
                                text: S.of(context).next_button,
                                horizontal: 30,
                                onPress: () async {
                                  // تحقق من صحة النموذج قبل المتابعة
                                  if (formkey.currentState!.validate()) {
                                    // عرض مؤشر تحميل أثناء العملية
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) => Center(child: CircularProgressIndicator()),
                                    );

                                    // تنفيذ التحقق من الكود
                                    await value.Verify();
                                    Navigator.of(context).pop(); // إغلاق التحميل

                                    // عرض نتيجة التحقق في حوار
                                    apiDialog.ShowApiDialog(
                                      context,
                                      title: value.vertfy['message'],
                                      onpressed: () {
                                        if (value.check) {
                                          Navigator.of(context).pushNamed('SigninPage'); // الانتقال إلى صفحة الدخول
                                        } else {
                                          Navigator.of(context).pop(); // إغلاق الحوار فقط
                                        }
                                      },
                                    );
                                  } else {
                                    // في حال كانت الحقول فارغة أو غير صحيحة
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          S.of(context).empty_field_message,
                                        ),
                                      ),
                                    );
                                  }
                                },
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
