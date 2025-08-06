import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/button_sign.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class DialogEditData {
  Future<void> ShowEditData(BuildContext context) async {
    final prov = Provider.of<Control>(context, listen: false);
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              S.of(context).edit_password,
              style: AppText.style18w400(context),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: EditingFeild(
                  hint: S.of(context).current_password,
                  nameController: prov.current_password,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: EditingFeild(
                  hint: S.of(context).new_password_hint,
                  nameController: prov.passwordd,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: EditingFeild(
                  hint: S.of(context).confirm_new_password,
                  nameController: prov.password_confirmation,
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: Button_Sign(
                text: S.of(context).save_password,
                horizontal: 20,
                onPress: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => Center(child: CircularProgressIndicator()),
                  );
                  await prov.UpdatePassword();
                  Navigator.of(context).pop();
                  showdoneedit(
                    context,
                    title: S.of(context).edit_success,
                    onPress: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void showdoneedit(
    BuildContext context, {
    required String title,
    VoidCallback? onPress,
    bool success = true,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: success ? Color.fromARGB(255, 77, 235, 95) : Colors.red,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: success
                      ? Color.fromARGB(255, 77, 235, 95).withOpacity(0.5)
                      : Colors.red.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(1, 4),
                ),
              ],
            ),
            child: Center(
              child: Icon(Icons.check_outlined, color: Colors.white, size: 30),
            ),
          ),
          content: Text(
            textAlign: TextAlign.center,
            success ? title : S.of(context).edit_failed,
            style: AppText.style10w600(context),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: onPress,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.Blue,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).ok,
                    style: AppText.style8w700(context),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class EditingFeild extends StatelessWidget {
  EditingFeild({super.key, required this.hint, required this.nameController});
  final String hint;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width < 600
          ? MediaQuery.sizeOf(context).width / 1.5
          : MediaQuery.sizeOf(context).width < 900
          ? MediaQuery.sizeOf(context).width / 2
          : MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.Grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.Grey),
          ),
          fillColor: Colors.white,
          hint: Text(
            hint,
            style: AppText.style11w500(context),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
