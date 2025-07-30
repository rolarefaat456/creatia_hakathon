import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 28/40,
            child: Image.asset(Assets.imagesCreativaLogo2)
          ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('StudentPage');
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CircleAvatar(
                    child: Image.asset(Assets.imagesTrophy, fit: BoxFit.fill,),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.imagesElprofile),
              ),
            )
        ],
      ),
    );
  }
}