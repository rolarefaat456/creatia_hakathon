import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/prov/control.dart';
import 'package:provider/provider.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<Control>(context, listen: false).startAnimation();
      // calling the animation with starting the app
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backGround Color
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.white,
                  AppColors.backgroundbabycolor.withOpacity(0.4),
                ],
              ),
            ),
            child: Column(
              children: [
                Consumer<Control>(
                  builder: (context, value, child) {
                    if (value.showtext){
                    return Container(
                      height: MediaQuery.sizeOf(context).width<600
                      ? MediaQuery.sizeOf(context).height/20
                      : MediaQuery.sizeOf(context).width<900
                      ? MediaQuery.sizeOf(context).height/25: MediaQuery.sizeOf(context).height/30,
                    );}else{
                      return SizedBox.shrink();
                    }
                  }
                ),
                // logo with animation blue page
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // creativa logo
                    Image.asset(Assets.imagesCreativeLogo,),
                    // animation blue page
                    Consumer<Control>(
                      builder: (context, value, child) {
                        return AnimatedOpacity(
                          opacity: value.hidden ? 0 : 1,
                          duration: Duration(milliseconds: 50),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            width: value.shrink
                                ? 50
                                : MediaQuery.of(context).size.width,
                            height: value.shrink
                                ? 50
                                : MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: AppColors.Blue,
                              borderRadius: BorderRadius.circular(
                                value.shrink
                                    ? MediaQuery.of(context).size.height
                                    : 0,
                              ),
                            ),
                            curve: Curves.easeInOut,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Consumer<Control>(
                  builder: (context, value, child) {
                    // delaying the text after the animation is Finish
                    if (value.showtext) {
                      return IntrinsicHeight(
                        child: Column(
                          children: [
                            // show texts
                            Padding(
                              padding: const EdgeInsets.only(top: 90, bottom: 20),
                              child: Text(
                                'مركز إبداع مصر الرقمي',
                                style: AppText.style32w400(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 80,
                                left: 40,
                                right: 40,
                              ),
                              child: Text(
                                'منظومة متكاملة لدعم الابتكار وريادة الأعمال في قطاع الاتصالات وتكنولوجيا المعلومات',
                                style: AppText.style22w400(context),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Spacer(),
                            // botton
                            Button_Sign(
                              
                                text: 'إبدء معنا الان',
                                onPress: () {
                                  Navigator.of(context).pushNamed('SigninPage');
                                }, horizontal: 70,
                              ),
                            
                          ],
                        ),
                      );
                      // if the animation not finish return nothing
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
