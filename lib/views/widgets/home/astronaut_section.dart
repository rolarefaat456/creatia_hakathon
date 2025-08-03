import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class AstronautSecction extends StatelessWidget {
  AstronautSecction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Control>(context, listen: false);
    return prov.getBanner == null ? CircularProgressIndicator() :
    Container(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: prov.getBanner['data'].length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
      width: MediaQuery.sizeOf(context).width<600
      ? MediaQuery.sizeOf(context).width/1.1
      :450,
      height: MediaQuery.sizeOf(context).width<600
      ? MediaQuery.sizeOf(context).width/1.9
      :300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(
            getImageUrl('${prov.baseUrl}/${prov.getBanner['data'][index]['image']}')
          ),
          fit: BoxFit.fill
        ),
      ),
      child: Stack(
        children: [
          // Container(
          //   margin: EdgeInsets.all(20),
          //   width: 60,
          //   height: 60,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(48),
          //     image: DecorationImage(
          //       image: AssetImage(Assets.imagesLogobyelard),
          //       fit: BoxFit.fill
          //     )
          //   ),
          // ),
          // Positioned(
          //   bottom: 15,
          //   right: 15,
          //   child: CircleAvatar(
          //     maxRadius: 30,
          //     backgroundColor: AppColors.Orange,
          //     child: Center(
          //       child: Text(
          //         'الحجز\n 13 أبريل',
          //         style: AppText.style8w700(context).copyWith(fontFamily: 'Lemonada', fontSize: 10),
          //         textAlign: TextAlign.center,
          //         textDirection: TextDirection.rtl,
          //       ),
          //     ),
          //   )
          // )
        ],
      ),
    )
          );
        },
      ),
    );
  }
}

