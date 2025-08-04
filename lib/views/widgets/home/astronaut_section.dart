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
    )
          );
        },
      ),
    );
  }
}

