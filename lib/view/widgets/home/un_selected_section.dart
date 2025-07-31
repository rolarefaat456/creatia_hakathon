
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/sections_model.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class UnSelectedSection extends StatelessWidget {
  const UnSelectedSection({
    super.key, required this.sectionsModel,
  });

  final SectionsModel sectionsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 42,
      // height: 42,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: sectionsModel.contenercolor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          sectionsModel.name,
          style: AppText.style12w400(context).copyWith(fontFamily: 'Tajawal', color: sectionsModel.textcolor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
