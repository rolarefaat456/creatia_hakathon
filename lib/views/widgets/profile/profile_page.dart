import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/api_dialog.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/profile/profile_form_feild.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.image,
    required this.name,
    required this.emailorphone,
  });
  final String image, name, emailorphone;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ApiDialog apiDialog = ApiDialog();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        // have a profile image and username
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          // زر التعديل في أقصى اليمين
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
                                  border: Border.all(color: AppColors.Grey),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed('EditProfileView');
                                  },
                                  child: Image.asset(
                                    Assets.imagesNotePencil,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // الاسم
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 15),
                            child: Text(
                              widget.name,
                              style: AppText.style16w400(context).copyWith(
                                fontFamily: 'Cairo',
                                color: AppColors.Deep_vilot,
                              ),
                            ),
                          ),
                          // البريد 
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              widget.emailorphone,
                              style: AppText.style16w400(context).copyWith(
                                fontFamily: 'Cairo',
                                color: AppColors.Deep_vilot,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                     // صورة البروفايل في المنتصف
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          widget.image
                        ),
                    ),
                  ],
                ),
              ),
              // العنوان "معلومات أساسية"
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  S.of(context).basic_info,
                  style: AppText.style18w400(context),
                ),
              ),
              // عرض البيانات الشخصية باستخدام Consumer
              Consumer<Control>(
                builder: (context, value, child) {
                  return Form(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: ProfileFormFeild(
                            hint: '',
                            readonly: false,
                            enable: false,
                            colortext: AppColors.Black,
                            nameController: value.profilename,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: ProfileFormFeild(
                            hint: '${S.of(context).phone_hint} :',
                            readonly: false,
                            enable: false,
                            colortext: AppColors.Black,
                            nameController: value.profilephone,
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width < 600
                              ? MediaQuery.sizeOf(context).width / 1.2
                              : MediaQuery.sizeOf(context).width < 900
                              ? MediaQuery.sizeOf(context).width / 2
                              : MediaQuery.sizeOf(context).width / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            enabled: false,
                            readOnly: false,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                              label: Text(
                                '******',
                                style: AppText.style12w500(
                                  context,
                                ).copyWith(color: AppColors.Black),
                              ),
                              hint: Text(
                                '${S.of(context).password_hint} :',
                                style: AppText.style12w500(
                                  context,
                                ).copyWith(color: AppColors.Black),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: ProfileFormFeild(
                            hint: '${S.of(context).city_hint} :',
                            readonly: false,
                            enable: false,
                            colortext: AppColors.Black,
                            nameController: value.profilecity,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // زر تسجيل الخروج
              Consumer<Control>(
                builder: (context, value, child) {
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Button_Sign(
                      text: S.of(context).logout,
                      horizontal: 20,
                      onPress: () async {
                        // عرض مؤشر تحميل أثناء تنفيذ العملية
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) =>
                              Center(child: CircularProgressIndicator()),
                        );
                        await value.Logout();
                        Navigator.of(context).pop(); // إغلاق مؤشر التحميل

                        // عرض رسالة الخروج
                        apiDialog.ShowApiDialog(
                          context,
                          title: value.logout['message'],
                          onpressed: () {
                            if (value.check) {
                              Navigator.of(context).pushNamed('SigninPage');
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
