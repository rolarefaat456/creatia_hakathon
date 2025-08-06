import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';

class InstructorInfo extends StatefulWidget {
  InstructorInfo({super.key, required this.image, required this.name, required this.emailorphone, });

  final String image, name, emailorphone;

  @override
  State<InstructorInfo> createState() => _InstructorInfoState();
}

class _InstructorInfoState extends State<InstructorInfo> {

  @override
  Widget build(BuildContext context) {
    return Container(
              // height: 275,
              margin: const EdgeInsets.all(30),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    // width: 380,
                    // height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60, bottom: 15),
                            child: Text(
                              widget.name,
                              style: AppText.style16w400(context).copyWith(fontFamily: 'Cairo', color: AppColors.Deep_vilot),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              widget.emailorphone,
                              style: AppText.style16w400(context).copyWith(fontFamily: 'Cairo', color: AppColors.Deep_vilot),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage( 
                      // getImageUrl(
                        widget.image
                        // ) 
                        ),
                  ),
                  
                ],
              ),
            );
  }
}