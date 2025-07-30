import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/jointed_widgets/section_name.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/componant/utils/app_images.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';
import 'package:hacathon_app/view/widgets/notifications/notification_data.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionName(name: 'الإشعارات',),
              NotificationData()
          ],
        ),
      ),
    );
  }
}
