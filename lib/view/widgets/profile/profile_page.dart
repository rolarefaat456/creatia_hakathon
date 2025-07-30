import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/view/widgets/profile/person_info.dart';
import 'package:hacathon_app/componant/models/Button_model.dart';
import 'package:hacathon_app/componant/models/person_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/view/widgets/profile/profile_form_feild.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
              PersonInfo( // m3lomat el profile
                personModel: PersonModel(
                  image: Assets.imagesElprofile,
                  name: 'Mohammed Khaled Ahmed',
                  emailorphone: 'Mohammed321Khaled@gmail.com',
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
                  buttonModel: ButtonModel(
                    text: 'تسجيل الخروج',
                    horizontal: 20,
                    onPress: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
