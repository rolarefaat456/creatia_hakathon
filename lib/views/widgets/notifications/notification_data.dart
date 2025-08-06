import 'package:flutter/material.dart';
import 'package:hacathon_app/components/models/notification_model.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';
// Widget مسؤولة عن عرض بيانات الإشعارات (Notifications)
// ignore: must_be_immutable
class NotificationData extends StatelessWidget {
  NotificationData({super.key});
 // قائمة إشعارات وهمية (افتراضية) لاستخدامها عند عدم توفر بيانات حقيقية من الـ API
  NotificationDataList notificationDataList = NotificationDataList();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        // تحقق إذا كانت البيانات غير متوفرة أو فارغة
        return (value.allNotification == null ||
                value.allNotification['data'] == null ||
                value.allNotification['data'].isEmpty)
                // استخدم البيانات الوهمية لعرض إشعارات افتراضية
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notificationDataList.data.length,
                // itemCount: value.allNotification['data'].length,
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
                          
                          child: ListTile(
                            leading: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                // علامة توضح أن الإشعار غير مقروء (افتراضيًا أول واحد فقط)
                                color:  index == 0? AppColors.Blue : Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            title: Text(
// نص تفصيلي أسفل الإشعار
                                  notificationDataList.data[index].title,
                              style: AppText.style10w400(context).copyWith(
                                color: AppColors.Black_Grey,
                                fontFamily: 'Noto_Kufi_Arabic',
                              ),
                              textAlign: TextAlign.end,
                            ),
                            subtitle: Text(
                              // value.allNotification['data'][index]['subtitle'],
                                  notificationDataList.data[index].subtitle,
                              style: AppText.style10w400(context).copyWith(
                                color: AppColors.Blue,
                                fontFamily: 'Noto_Kufi_Arabic',
                              ),
                              textAlign: TextAlign.end,
                            ),
                            trailing: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                
                                notificationDataList.data[index].image,
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
              )
              // في حال تحميل البيانات من الـ API
            : value.isLoading
            ? CircularProgressIndicator()
            // عرض الإشعارات الحقيقية
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
                            // عند الضغط على الإشعار: تحديث حالته كمقروء
                            await value.ReadNotifications(
                              id: value.allNotification['data'][index]['id'],
                            );
                            // إعادة تحميل كل الإشعارات
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
                                // getImageUrl(
                                "${value.baseUrl}/${value.allNotification['data'][index]['image']}"
                                  
                                // )
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
