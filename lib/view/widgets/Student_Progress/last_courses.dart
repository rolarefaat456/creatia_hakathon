
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/prov/control.dart';
import 'package:hacathon_app/view/widgets/Student_Progress/course_data_student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastCourses extends StatelessWidget {
  const LastCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          children: [
            Row(
              children: [
                MediaQuery.sizeOf(context).width<600?
                Expanded(child: Chart()):
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 190,
                    // minHeight: 50
                  ),
                  // margin: EdgeInsets.all(10),
                  // height: 190,
                  child: Chart()
                ),
                MediaQuery.sizeOf(context).width<600?
                Container():
                Spacer(),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'اخر الدورات :',
                        style: AppText.style11w500(context).copyWith(color: AppColors.Baby_Black),
                        textDirection: TextDirection.rtl
                      ),
                    ),
                    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'برمجة تطبيقات Flutter',
                    style: AppText.style14w400(context),
                    textDirection: TextDirection.rtl
                  ),
                ),
                Container(
                  width: 250,
                  child: ListTile(
                    trailing: CircleAvatar(backgroundImage: AssetImage(Assets.imagesElprofile)),
                    title: Text(
                      'instructor',
                      style: AppText.style9w500(context).copyWith(color: AppColors.Grey),
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(
                      'Mohammed Hanafy Mahmoud',
                      style: AppText.style9w500(context),
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CourseDataStudent(text: 'Basics Dart : 64 %', width: 56, color: AppColors.YellowOrange,),
                CourseDataStudent(text: 'Flutter Widgets : 30 %', width: 28, color: AppColors.Blue,),
                CourseDataStudent(text: 'Provider : 80 %', width: 70, color: AppColors.White_Blue,),
              ],
            )
          ],
        ),
    );
  }
}


class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
      
    return AspectRatio(
      aspectRatio: 1, // keda tolha 2d 3rdha 3la tol
      child: Consumer<Control>(
        builder: (context, value, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              PieChart( // package gahza bt3ml el dayra elly btbyn el asthlak maslan
                getChartData(context)
              ),
              Text(
            '87%',
            style: AppText.style16w800(context),
            
          ),
            ],
          );
        }
      ),
    );
  }



    PieChartData getChartData(BuildContext context){
      final activeIndex = Provider.of<Control>(context).activeIndex;
    return PieChartData(
      pieTouchData: PieTouchData(
        enabled: true,
        touchCallback: (p0, PieTouchResponse) {
          // by3ml animation lma e7sal touch 3lyh
          final touchedIndex = PieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1; // keda p2olo lw null 7ot -1
          Provider.of<Control>(context, listen: false).selectactiveIndex(touchedIndex);
        },
      ),
      
      sectionsSpace: 0,
      sections: [
        PieChartSectionData(
          showTitle: false,
          value: 64,
          radius: activeIndex == 0 ? 20 : 10, // somk el dayra
          color: AppColors.Dark_Orange,

        ),
        PieChartSectionData(
          showTitle: false,
          radius: activeIndex == 1 ? 20 : 10,
          value: 36,
          color: AppColors.Dark_Yellow,
        ),
        
      ]
    );
  }
}