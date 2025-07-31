
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/models/notification_model.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

// ignore: must_be_immutable
class NotificationData extends StatelessWidget {
  NotificationData({
    super.key,
  });

  NotificationDataList notificationDataList = NotificationDataList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notificationDataList.data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                leading: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color:  index == 0? AppColors.Blue : Colors.white,
                    shape: BoxShape.circle
                  ),
                ),
                title: Text(
                  notificationDataList.data[index].title,
                  style: AppText.style10w400(context).copyWith(color: AppColors.Black_Grey, fontFamily: 'Noto_Kufi_Arabic'),
                  textAlign: TextAlign.end,
                ),
                subtitle: Text(
                  notificationDataList.data[index].subtitle,
                  style: AppText.style10w400(context).copyWith(color: AppColors.Blue, fontFamily: 'Noto_Kufi_Arabic'),
                  textAlign: TextAlign.end,
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(notificationDataList.data[index].image)
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Text(
                    notificationDataList.data[index].text,
                    style: AppText.style10w400(context).copyWith(color: Color.fromARGB(255, 157, 157, 157), fontFamily: 'Noto_Kufi_Arabic'),
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}