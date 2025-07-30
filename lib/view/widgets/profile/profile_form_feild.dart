import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class ProfileFormFeild extends StatefulWidget {
  ProfileFormFeild({super.key, required this.hint,required this.lable, required this.readonly, required this.enable, required this.colortext});

  final String hint, lable;
  final bool readonly, enable;
  final Color colortext;


  @override
  State<ProfileFormFeild> createState() => _ProfileFormFeildState();
}

class _ProfileFormFeildState extends State<ProfileFormFeild> {

  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.lable);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width < 600
      ? MediaQuery.sizeOf(context).width / 1.2
      : MediaQuery.sizeOf(context).width < 900
      ? MediaQuery.sizeOf(context).width / 2
      : MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextFormField(
        controller: nameController,
        style: AppText.style12w500(context).copyWith(color: widget.colortext ),
        enabled: widget.enable,
        readOnly: widget.readonly,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
          fillColor: Colors.white,
          suffix: Text(
            widget.hint,
            style: AppText.style12w500(context).copyWith(color: AppColors.Black),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}