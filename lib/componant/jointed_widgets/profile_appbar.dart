import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: AspectRatio(
              aspectRatio: 1,
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.imagesElprofile),
              ),
            )
            ),
            Spacer(),
            Container(
              width: 50,
              height: 50,
              // margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40)
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