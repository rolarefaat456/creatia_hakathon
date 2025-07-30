class CourseLevelModel {
  final String title, subtitle;

  CourseLevelModel(this.title, this.subtitle);
}

class CourseLevel{
  List<CourseLevelModel> levels = [
    CourseLevelModel('1. Level 1 : Dart Basics', 'Dart Programming Language \nBasics Tutorials'),
    CourseLevelModel('2. Level 2 : Flutter Widgets', 'Learn How To Use Widgets \nand Build a Strong UI Design'),
    CourseLevelModel('3. Level 3 : State Management', 'Learn How To Use Provider \nand Managing Your Project easly')
  ];
}