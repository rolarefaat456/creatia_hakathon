
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CoursesDataLevels extends StatelessWidget {
  CoursesDataLevels({
    super.key, required this.source,
  });

  final String source;

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return value.allSections['data'] == null ? Center(
          child: Text(
            'لا يوجد محتوى لعرضه',
            style: AppText.style16w400(context),
          ),
        )
      : ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: value.allSections?['data']?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                
                  value.allSections['data'][index]['title'] ,
                  style: AppText.style16w400(context).copyWith(fontFamily: 'Finger_Paint', color: AppColors.Blue),
                ),
                subtitle: Padding(
  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
  child: Text(
    
    (value.allSections?['data']?[index]?['lessons'] as List<dynamic>?)?.join('\n') ?? 'No lessons',
    textAlign: TextAlign.start,
    style: AppText.style12w400(context).copyWith(color: AppColors.Black),
  ),
),
            );
          }
        );
      }
    );
  }
}