import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_images.dart';

class Signinappbar extends StatefulWidget {
  const Signinappbar({super.key});

  @override
  State<Signinappbar> createState() => _SigninappbarState();
}

class _SigninappbarState extends State<Signinappbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 28/40,
            child: Image.asset(Assets.imagesCreativaLogo2)
          ),
          Container(
              width: 50,
              height: 50,
              // margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                }, child: Icon(Icons.arrow_forward_ios_rounded, size: 15,)
              ),
            )
        ],
      ),
    );
  }
}