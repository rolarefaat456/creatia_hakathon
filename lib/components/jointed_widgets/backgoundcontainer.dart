import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';

class Backgoundcontainer extends StatelessWidget {
  const Backgoundcontainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.white,
              AppColors.backgroundbabycolor.withOpacity(0.3),
            ],
          ),
        ),
      child: child,
    );
  }
}