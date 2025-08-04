
import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          currentIndex: value.CurrentIndex,
          onTap: (val) {
            value.selected(val);
          },
          iconSize: 28,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.Blue,
          unselectedItemColor: AppColors.Black,
          selectedIconTheme: IconThemeData(color: AppColors.Blue),
          unselectedIconTheme: IconThemeData(
            color: AppColors.Black,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesUser, width: 20, height: 28, color: value.CurrentIndex==0? AppColors.Blue : AppColors.Black,),
              label: 'حسابي',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesHeadset, width: 20, height: 28, color: value.CurrentIndex==1? AppColors.Blue : AppColors.Black,),
              label: 'الدعم',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesHeart, width: 20, height: 28, color: value.CurrentIndex==2? AppColors.Blue : AppColors.Black,),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesBell, width: 20, height: 28, color: value.CurrentIndex==3? AppColors.Blue : AppColors.Black,),
              label: 'الإشعارات',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(Assets.imagesCreativaLogo2, width: 20, height: 28, color: value.CurrentIndex==4? null : AppColors.Black,),
              label: 'الرئيسية',
            ),
          ],
        );
      },
    );
  }
}
