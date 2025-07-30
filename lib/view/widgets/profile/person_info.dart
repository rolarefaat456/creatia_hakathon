import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/models/person_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class PersonInfo extends StatefulWidget {
  PersonInfo({super.key, required this.personModel});

  final PersonModel personModel;

  @override
  State<PersonInfo> createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            widget.personModel.name,
                            style: AppText.style16w400(context).copyWith(fontFamily: 'Cairo', color: AppColors.Deep_vilot),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            widget.personModel.emailorphone,
                            style: AppText.style16w400(context).copyWith(fontFamily: 'Cairo', color: AppColors.Deep_vilot),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(widget.personModel.image),
                  ),
                  
                ],
              ),
            );
  }
}