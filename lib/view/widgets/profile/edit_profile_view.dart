import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/jointed_widgets/button_sign.dart';
import 'package:hacathon_app/componant/jointed_widgets/profile_appbar.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/view/widgets/profile/dialog_edit_data.dart';
import 'package:hacathon_app/view/widgets/profile/profile_form_feild.dart';

// ignore: must_be_immutable
class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  DialogEditData dialogEditData = DialogEditData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(height: 70, child: ProfileAppbar()),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 95,
                        backgroundImage: AssetImage(Assets.imagesElprofile),
                      ),
                      Positioned(
                        top: 150,
                        right: 15,
                        child: IconButton(
                          onPressed: () {},
                          icon: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                                // width: 0.,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Icon(Icons.camera_alt_outlined, size: 18,)
                          ),
                        ),
                      ),
                    ],
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
                            readonly: true,
                            enable: true,
                            colortext: AppColors.Grey,
                            lable: 'Mohammed Ali Khaled Kamel',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: ProfileFormFeild(
                            hint: 'رقم الهاتف :',
                            readonly: true,
                            enable: true,
                            colortext: AppColors.Grey,
                            lable: '+20 01083765456221',
                          ),
                        ),
                        InkWell(
                          onTap: () => dialogEditData.ShowEditData(context),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ProfileFormFeild(
                              hint: 'كلمة المرور :',
                              readonly: true,
                              enable: true,
                              colortext: AppColors.Black,
                              lable: '******',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: ProfileFormFeild(
                            hint: 'المدينة :',
                            readonly: true,
                            enable: true,
                            colortext: AppColors.Grey,
                            lable: 'سوهاج',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button_Sign(
  
                            text: 'إلغاء',
                            horizontal: 20,
                            onPress: () {
                              Navigator.of(context).pop();
                            },
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Button_Sign(
                    
                              text: 'حفظ التغيرات',
                              horizontal: 5,
                              onPress: () {
                                dialogEditData.ShowEditData(context);
                                Navigator.of(context).pop();
                              },
                              color: AppColors.White_Blue,
                            ),
                          ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
