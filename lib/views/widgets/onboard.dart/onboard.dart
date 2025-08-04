import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
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
      // انيميشن ال صفحه الزرقاء
    });
    Future.delayed(Duration(milliseconds: 2300), () {
      Provider.of<Control>(context, listen: false).setappearance(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Control>(context, listen: false);
    return Scaffold(
      appBar: prov.appearance
          ? null
          : AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              actions: [
                Consumer<Control>(
                  builder: (context, value, child) {
                    return 
                    Container(
                      margin: EdgeInsets.only(
                        left: value.isArabic()? 10 : 0,
                        right: value.isArabic()? 0 : 10
                      ),
                      child: IconButton(
                      onPressed: () {
                        value.ChangeLanguage();
                      },
                      icon: Icon(Icons.language, color: AppColors.Blue,),
                    )
                    );
                  },
                ),
              ],
            ),

      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height,
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
                // logo with animation blue page
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // creativa logo
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 187,
                        maxWidth: 180,
                      ),
                      child: AspectRatio(
                        aspectRatio: 180 / 187,
                        child: Image.asset(Assets.imagesCreativeLogo),
                      ),
                    ),
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
                      return Column(
                        children: [
                          // show texts
                          Padding(
                            padding: const EdgeInsets.only(top: 90, bottom: 20),
                            child: Text(
                              S
                                  .of(context)
                                  .BoardTitle, // el key elly adato ll gomla bt3ty
                              // 'مركز إبداع مصر الرقمي',
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
                              S.of(context).BoardSubtitle,
                              style: AppText.style22w400(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // botton
                          Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).width < 600
                                  ? MediaQuery.sizeOf(context).height / 5
                                  : MediaQuery.sizeOf(context).width < 900
                                  ? MediaQuery.sizeOf(context).height / 3
                                  : MediaQuery.sizeOf(context).height / 2,
                            ),
                            child: Button_Sign(
                              text: S.of(context).BourdButton,
                              onPress: () {
                                Navigator.of(context).pushNamed('SigninPage');
                              },
                              horizontal: 70,
                            ),
                          ),
                        ],
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
