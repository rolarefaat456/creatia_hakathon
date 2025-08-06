import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/api_dialog.dart';
import 'package:hacathon_app/components/widgets/button_courses_section.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/Student_Progress/courses_content_view.dart';
import 'package:hacathon_app/components/models/button_courses_model.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/views/widgets/bookcouse/book_course_content.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CourseSection extends StatelessWidget {
  ApiDialog apiDialog = ApiDialog();

  CourseSection({
    super.key,
    required this.name,
    required this.fontfamily,
    this.containercolor = AppColors.Blue,
    this.specialIndex,
    this.specialButtonData,
    required this.source,
  });

  final String name, fontfamily, source;
  final int? specialIndex;
  final Color containercolor;
  final ButtonCoursesModel? specialButtonData;

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        print(value.myCourses);
        return value.allCourses == null
            ? CircularProgressIndicator()
            : GridView.builder(
                itemCount: source == 'Home'
                    ? value.allCourses['data'].length
                    : source == 'Favorite'
                    ? value.allFavorite['data'].length
                : value.myCourses['data'].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.sizeOf(context).width < 600
                      ? 2
                      : MediaQuery.sizeOf(context).width < 900
                      ? 3
                      : MediaQuery.sizeOf(context).width < 1400
                      ? 4
                      : 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: MediaQuery.sizeOf(context).width < 600
                      ? MediaQuery.sizeOf(context).width / 0.96
                      : MediaQuery.sizeOf(context).width < 900
                      ? MediaQuery.sizeOf(context).width / 2
                      : MediaQuery.sizeOf(context).width < 1400
                      ? MediaQuery.sizeOf(context).width / 2.6
                      : MediaQuery.sizeOf(context).width / 3.8,
                ),
                itemBuilder: (context, index) {
                  bool isSpecial = index == specialIndex;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            if (source == 'Home') {
                              return BookCourseContent(
                                image:
                                    '${value.baseUrl}/${value.allInstractors['data'][index]['image']}',
                                name:
                                    value.allInstractors['data'][index]['name'],
                                phone: value
                                    .allInstractors['data'][index]['phone'],
                                source: 'Home',
                              );
                            } else if (source == 'Favorite') {
                              return BookCourseContent(
                                image:
                                    (value.allFavorite != null &&
                                        index < value.allFavorite.length)
                                    ? '${value.baseUrl}/${value.allFavorite['data'][index]['myinstractor']['image']}'
                                    : '',
                                name: value.allInstractors['data'][index]['name'],
                                phone: value
                                    .allInstractors['data'][index]['phone'],
                                source: 'Favorite',
                              );
                            } else {
                              return CoursesContentView(
                                image:
                                    '${value.baseUrl}/${value.allInstractors['data'][index]['image']}',
                                name:
                                    value.allInstractors['data'][index]['name'],
                                phone: value
                                    .allInstractors['data'][index]['phone'],
                                index: index,
                                source: 'Student',
                              );
                            }
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 204,
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                  child: source == 'Home'
                                      ? Image.network(
                                          // getImageUrl(
                                            '${value.baseUrl}/${value.allCourses['data'][index]['image']}',
                                          // ),
                                          fit: BoxFit.fill,
                                        )
                                      : source == 'Favorite'
                                      ? Image.network(
                                            '${value.baseUrl}/${value.allFavorite['data'][index]['image']}',
                                          )
                                      : Image.network(
                                          // getImageUrl(
                                            '${value.baseUrl}/${value.allCourses['data'][index]['image']}',
                                          // ),
                                          
                                        ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                      print('is loading');
                                      int courseId;

                                      if (source == 'Home') {
                                        courseId = value
                                            .allCourses['data'][index]['id'];
                                      } else {
                                        courseId = value
                                            .myCourses['data'][index]['course']['id'];
                                      }

                                      await value.AddFavorite(id: courseId);

                                      print('add is done');
                                      Navigator.of(context).pop();
                                      apiDialog.ShowApiDialog(
                                        context,
                                        title: value.addFavorite['message'],
                                        onpressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      print('done');
                                    },
                                    icon: Center(
                                      child: Icon(
                                        source == 'Favorite'
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 9,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            // course name
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              source == 'Home'
                                  ? value.allCourses['data'][index]['category']
                                  : source == 'Favorite'
                                  ? value.allFavorite?['data']?[index]?['course']?['category'] ?? ""
                                  : value.myCourses?['data']?[index]?['category'] ?? value.allCourses['data'][index]['category'],
                              style: AppText.style12w400(
                                context,
                              ).copyWith(color: AppColors.Black),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            // asm elly byshr7
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                source == 'Home'
                                    ? value.allCourses['data'][index]['instractor'] !=
                                              null
                                          ? value
                                                .allCourses['data'][index]['instractor']['name']
                                          : ''
                                    : source == 'Favorite'
                                    ? value
                                          .allFavorite?['data']?[index]?['myinstractor']?['name'] ?? " no favorite"
                                    : value
                                          .myCourses?['data']?[index]?['course']?['myinstractor']?['name'] ?? value.allCourses['data'][index]['myinstractor']['name'],

                                // value.allCourses['data'][index]['instractor']['name'],
                                style: AppText.style12w400(
                                  context,
                                ).copyWith(color: AppColors.Grey),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            // el tkym
                            margin: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.StarYellow,
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.StarYellow,
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.StarYellow,
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.StarYellow,
                                ),
                                Icon(
                                  Icons.star_half_rounded,
                                  color: AppColors.StarYellow,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          ButtonoursesSection(
                            buttonCoursesModel:
                                isSpecial && specialButtonData != null
                                ? specialButtonData!
                                : ButtonCoursesModel(
                                    text: name,
                                    fontfamily: fontfamily,
                                    containercolor: containercolor,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
