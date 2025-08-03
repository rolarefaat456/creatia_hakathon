
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

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