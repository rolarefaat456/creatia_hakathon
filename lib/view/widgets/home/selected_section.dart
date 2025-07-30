
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/sections_model.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class SelectedSection extends StatelessWidget {
  const SelectedSection({
    super.key, required this.sectionsModel,
  });

  final SectionsModel sectionsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 42,
      // height: 42,
      padding: EdgeInsets.symmetric( horizontal: 25),
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
