import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

/// ويدجت لعرض القسم المختار (Selected Section)
/// يتم استخدامه عند الضغط على قسم لتغيير الشكل (لون مختلف)
class SelectedSection extends StatelessWidget {
  const SelectedSection({
    super.key,
    required this.name,
    this.contenercolor = Colors.white,// اللون الخلفي الافتراضي
    this.textcolor = AppColors.Deep_vilot,// لون النص الافتراضي
  });

  /// اسم القسم اللي هيظهر
  final String name;
  /// ألوان الخلفية والنص (قابلة للتغيير)
  final Color contenercolor, textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // المسافة الداخلية (padding) لاحتواء النص
      padding: EdgeInsets.symmetric(horizontal: 25),
      // تنسيق الشكل العام للحاوية
      decoration: BoxDecoration(
        color: contenercolor,
        borderRadius: BorderRadius.circular(10),// الزوايا الدائرية
      ),
       // محتوى الكونتينر: النص في المنتصف
      child: Center(
        child: Text(
          name,
          style: AppText.style12w400(
            context,
          ).copyWith(fontFamily: 'Tajawal', color: textcolor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
