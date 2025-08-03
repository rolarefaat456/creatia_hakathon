
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class UnSelectedSection extends StatelessWidget {
  const UnSelectedSection({
    super.key, required this.name, this.contenercolor = Colors.white, this.textcolor = AppColors.Deep_vilot
  });

  // final SectionsModel sectionsModel;
  final String name;
  final Color contenercolor, textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 42,
      // height: 42,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: contenercolor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          name,
          style: AppText.style12w400(context).copyWith(fontFamily: 'Tajawal', color: textcolor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
