import 'package:hacathon_app/components/utils/app_images.dart';

class NotificationModel {
  final String image, title, subtitle, text;

  NotificationModel({required this.image, required this.title, required this.subtitle, required this.text});
}

class NotificationDataList {
  List<NotificationModel> data = [
    NotificationModel(image: Assets.imagesShakloai, title: 'Mohammed Ali', subtitle: 'Instructor', text: 'لديك مشكلة في حل تاسك المحاضرة الثالثة'),
    NotificationModel(image: Assets.imagesCreativeLogo, title: 'Mohammed Ali', subtitle: 'Creativa', text: 'تم تسجيل الإشتراك الخاص بك بنجاح'),
    NotificationModel(image: Assets.imagesWalad, title: 'Mohammed Ali', subtitle: 'Instructor', text: 'تم تسجيل الإشتراك الخاص بك بنجاح')
  ];
}