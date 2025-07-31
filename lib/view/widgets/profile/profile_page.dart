import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/view/widgets/profile/profile_form_feild.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.image, required this.name, required this.emailorphone});
  final String image, name, emailorphone;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
              // height: 275,
              margin: const EdgeInsets.all(30),
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    // width: 400,
                    // height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26),
                                border: Border.all(
                                  color: AppColors.Grey
                                )
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed('EditProfileView');
                                },
                                child: Image.asset(Assets.imagesNotePencil, width: 30,height: 30,)
                              )
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40 ,bottom: 15),
                          child: Text(
                            widget.name,
                            style: AppText.style16w400(context).copyWith(fontFamily: 'Cairo', color: AppColors.Deep_vilot),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            widget.emailorphone,
                            style: AppText.style16w400(context).copyWith(fontFamily: 'Cairo', color: AppColors.Deep_vilot),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(widget.image),
                  ),

                ],
              ),
            ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'البيانات الأساسية',
                  style: AppText.style18w400(context),
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: ProfileFormFeild(
                        hint: '',
                        readonly: false,
                        enable: false,
                        colortext: AppColors.Black,
                        lable: 'Mohammed Ali Khaled Kamel',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: ProfileFormFeild(
                        hint: 'رقم الهاتف :',
                        readonly: false,
                        enable: false,
                        colortext: AppColors.Black,
                        lable: '+20 01083765456221',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: ProfileFormFeild(
                        hint: 'كلمة المرور :',
                        readonly: false,
                        enable: false,
                        colortext: AppColors.Black,
                        lable: '******',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: ProfileFormFeild(
                        hint: 'المدينة :',
                        readonly: false,
                        enable: false,
                        colortext: AppColors.Black,
                        lable: 'سوهاج',
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Button_Sign(
                    text: 'تسجيل الخروج',
                    horizontal: 20,
                    onPress: () {},
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
