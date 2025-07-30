import 'package:hacathon_app/componant/utils/app_images.dart';

class CourseModel {
  final String image, course_name, person_name;

  CourseModel({required this.image, required this.course_name, required this.person_name});
}

class CourseData {
  List<CourseModel> courses = [
    CourseModel(image: Assets.imagesAnsan, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesAnsantany, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesAsanbktapat, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesAsanfr7an, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesAsyawy, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesAsyawybyktabat, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesAyawytany, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesByslm, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesHmada, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    CourseModel(image: Assets.imagesSaklomasry, course_name: 'Dart Programming Language \nBasics Tutorials', person_name: 'Mohammed Ali'),
    ];
}