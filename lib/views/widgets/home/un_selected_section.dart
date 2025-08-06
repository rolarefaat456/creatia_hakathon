import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

/// ويدجت لعرض القسم الغير مختار (Unselected Section)
/// يظهر بلون مختلف
class UnSelectedSection extends StatelessWidget {
  const UnSelectedSection({
    super.key,
    required this.name,
    this.contenercolor = Colors.white, // اللون الخلفي الافتراضي
    this.textcolor = AppColors.Deep_vilot,  // لون النص الافتراضي  });
  });
  /// اسم القسم المعروض داخل العنصر
  final String name;
  /// ألوان الخلفية والنص (قابلة للتخصيص)
  final Color contenercolor, textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // مسافة داخلية للنص (علوي + جانبي)
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // تنسيق الشكل العام للعنصر
      decoration: BoxDecoration(
        color: contenercolor,// لون الخلفية
        borderRadius: BorderRadius.circular(10), // حواف دائرية
      ),
      // عرض النص في منتصف العنصر
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
