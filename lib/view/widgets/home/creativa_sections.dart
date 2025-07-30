
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/sections_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/prov/control.dart';
import 'package:hacathon_app/view/widgets/home/selected_section.dart';
import 'package:hacathon_app/view/widgets/home/un_selected_section.dart';
import 'package:provider/provider.dart';

class CreativaSections extends StatelessWidget {
  CreativaSections({
    super.key,
  });

  sectionsData sectionsdata = sectionsData();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sectionsdata.sectiondata.length,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: value.selectedindex == index ? AppColors.Deep_vilot : Colors.white,
    borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  value.seclected(index);
                },child: value.selectedindex == index?
                SelectedSection(sectionsModel: SectionsModel(name: sectionsdata.sectiondata[index]['name'], contenercolor: AppColors.Deep_vilot, textcolor: Colors.white))
                :UnSelectedSection(sectionsModel: SectionsModel( name: sectionsdata.sectiondata[index]['name'])),
              ),
            );
          },
        );
      }
    );
  }
}
