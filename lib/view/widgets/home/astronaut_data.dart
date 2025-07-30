import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class AstronautData extends StatelessWidget {
  const AstronautData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width<600
      ? MediaQuery.sizeOf(context).width/.5
      :450,
      height: MediaQuery.sizeOf(context).width<600
      ? MediaQuery.sizeOf(context).width/1.9
      :300,
      // width: 450,
      // height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(Assets.imagesRadelfdaa),
          fit: BoxFit.fill
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              image: DecorationImage(
                image: AssetImage(Assets.imagesLogobyelard),
                fit: BoxFit.fill
              )
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: CircleAvatar(
              maxRadius: 30,
              backgroundColor: AppColors.Orange,
              child: Center(
                child: Text(
                  'الحجز\n 13 أبريل',
                  style: AppText.style8w700(context).copyWith(fontFamily: 'Lemonada', fontSize: 10),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}