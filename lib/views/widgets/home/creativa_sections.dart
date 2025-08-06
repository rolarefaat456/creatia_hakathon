import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/home/selected_section.dart';
import 'package:hacathon_app/views/widgets/home/un_selected_section.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreativaSections extends StatelessWidget {
  CreativaSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        // عرض مؤشر تحميل لو البيانات مش جاهزة
        if (value.getcategory == null) {
      return Center(child: CircularProgressIndicator());
    }
    // عرض السكاشن
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.getcategory['data'].length,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOutQuart,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                // تحديد السكشن
                color: value.selectedindex == index
                    ? AppColors.Deep_vilot
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  value.seclected(index);
                },
                child: value.selectedindex == index
                    ? SelectedSection(
                          name: value.getcategory['data'][index]['name'],
                          contenercolor: AppColors.Deep_vilot,
                          textcolor: Colors.white,
                      )
                    : UnSelectedSection(
                          name: value.getcategory['data'][index]['name'],
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
