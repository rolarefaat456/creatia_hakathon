import 'package:flutter/material.dart';
import 'package:hacathon_app/components/models/notification_model.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NotificationData extends StatelessWidget {
  NotificationData({super.key});

  NotificationDataList notificationDataList = NotificationDataList();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return (value.allNotification == null ||
                value.allNotification['data'] == null ||
                value.allNotification['data'].isEmpty)
            ? Center(child: Text(S.of(context).no_notification))
            : value.isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.allNotification['data'].length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            await value.ReadNotifications(
                              id: value.allNotification['data'][index]['id'],
                            );
                            await value.AllNotification();
                          },
                          child: ListTile(
                            leading: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color:
                                    value.allNotification['data'][index]['read'] ==
                                        false
                                    ? AppColors.Blue
                                    : Colors.white,
                                // color:  index == 0? AppColors.Blue : Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            title: Text(
                              value.allNotification['data'][index]['title'],
                                  // notificationDataList.data[index].title,
                              style: AppText.style10w400(context).copyWith(
                                color: AppColors.Black_Grey,
                                fontFamily: 'Noto_Kufi_Arabic',
                              ),
                              textAlign: TextAlign.end,
                            ),
                            subtitle: Text(
                              value.allNotification['data'][index]['subtitle'],
                                  // notificationDataList.data[index].subtitle,
                              style: AppText.style10w400(context).copyWith(
                                color: AppColors.Blue,
                                fontFamily: 'Noto_Kufi_Arabic',
                              ),
                              textAlign: TextAlign.end,
                            ),
                            trailing: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                getImageUrl(value.allNotification['data'][index]['image'])
                                // notificationDataList.data[index].image,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 50,
                            ),
                            child: Text(
                              // value.allNotification['data'][index]['text'],
                              notificationDataList.data[index].text,
                              style: AppText.style10w400(context).copyWith(
                                color: Color.fromARGB(255, 157, 157, 157),
                                fontFamily: 'Noto_Kufi_Arabic',
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
