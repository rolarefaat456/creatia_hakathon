import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/components/widgets/section_name.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/views/widgets/notifications/notification_data.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionName(name: S.of(context).notifications,),
              NotificationData()
          ],
        ),
      ),
    );
  }
}
