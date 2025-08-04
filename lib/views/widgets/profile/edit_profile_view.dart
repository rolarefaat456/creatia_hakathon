import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/api_dialog.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/widgets/profile_appbar.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/profile/dialog_edit_data.dart';
import 'package:hacathon_app/views/widgets/profile/profile_form_feild.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditProfileView extends StatefulWidget {
  EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  DialogEditData dialogEditData = DialogEditData();
  ApiDialog apiDialog = ApiDialog();

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final prov = Provider.of<Control>(context, listen: false);
      await prov.Profile();
      prov.initializeControllers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Consumer<Control>(
                builder: (context, value, child) {
                  if (value.profile == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      Container(height: 70, child: ProfileAppbar()),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 90,
                            backgroundImage:
                                value.profile['data']['image'] != null
                                ? NetworkImage( getImageUrl(value.profile['data']['image']) )
                                      as ImageProvider
                                : AssetImage(Assets.imagesElprofile),
                          ),
                          Positioned(
                            top: 145,
                            right: 15,
                            child: Consumer<Control>(
                              builder: (context, value, child) {
                                return IconButton(
                                  onPressed: () {
                                    value.pickImageFromGallery();
                                  },
                                  icon: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26,
                                        // width: 0.,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 18,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          S.of(context).basic_info,
                          style: AppText.style18w400(context),
                        ),
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ProfileFormFeild(
                                hint: '',
                                readonly: false,
                                enable: true,
                                colortext: AppColors.Grey,
                                nameController: value.profilename,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ProfileFormFeild(
                                hint: "${S.of(context).phone_hint} :",
                                readonly: false,
                                enable: true,
                                colortext: AppColors.Grey,
                                nameController: value.profilephone,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ProfileFormFeild(
                                hint: "${S.of(context).email_hint} :",
                                readonly: false,
                                enable: true,
                                colortext: AppColors.Grey,
                                nameController: value.profileemail,
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
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                  await value.UpdatePassword();
                                  if (!mounted) return;
                                  Navigator.of(context).pop();
                                  await dialogEditData.ShowEditData(context);
                                },

                                enabled: true,
                                readOnly: true,
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
                                  suffix: Text(
                                    "${S.of(context).password_hint} :",
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
                                hint: "${S.of(context).city_hint} :",
                                readonly: false,
                                enable: true,
                                colortext: AppColors.Grey,
                                nameController: value.profilecity,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).width < 600
                                    ? MediaQuery.sizeOf(context).height / 10
                                    : MediaQuery.sizeOf(context).width < 1400
                                    ? MediaQuery.sizeOf(context).height / 1.9
                                    : MediaQuery.sizeOf(context).height / 4,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Button_Sign(
                                    text: S.of(context).cancel,
                                    horizontal: 20,
                                    onPress: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15,),
                                    child: Button_Sign(
                                      text: S.of(context).save_changes,
                                      horizontal: 5,
                                      onPress: () async {
                                        if (formkey.currentState!.validate()) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (_) => Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                          await value.UpdateProfile();
                                          if (!mounted) return; // lsa fy el mkan bta3y
                                  Navigator.of(context).pop();
                                  apiDialog.ShowApiDialog(context, title: S.of(context).edit_success, onpressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },);
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                S.of(context).fill_all_data,
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
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
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
