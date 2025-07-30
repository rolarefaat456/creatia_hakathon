import 'package:flutter/material.dart';
import 'package:hacathon_app/view/widgets/home/astronaut_data.dart';

class AstronautSecction extends StatelessWidget {
  const AstronautSecction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 600?
    Container(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: AstronautData()
          );
        },
      ),
    )
    :AstronautData();
  }
}

