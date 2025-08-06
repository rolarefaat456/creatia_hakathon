import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_images.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/widgets/favourite_courses.dart/Favorites_Page.dart';
import 'package:hacathon_app/views/widgets/notifications/Notifications_Page.dart';
import 'package:hacathon_app/views/widgets/support/SupportPage.dart';
import 'package:hacathon_app/views/widgets/home/home_page.dart';
import 'package:hacathon_app/views/widgets/profile/profile_page.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).Profile();
      Provider.of<Control>(context, listen: false).AddCategories();
      Provider.of<Control>(context, listen: false).GetBanner();
      Provider.of<Control>(context, listen: false).AllInstractors();
      Provider.of<Control>(context, listen: false).AllCourses();
      Provider.of<Control>(context, listen: false).MyCourses();
      Provider.of<Control>(context, listen: false).AllSections();
      Provider.of<Control>(context, listen: false).AllFavorite();
      Provider.of<Control>(context, listen: false).AllNotification();
    });
  }

  final List<Widget> pages = [
    Consumer<Control>(
      builder: (context, value, child) {
        return ProfilePage(
          image: "${value.baseUrl}/${value.profile['data']['image']}",
          name: value.profile['data']['name'],
          emailorphone: value.profile['data']['email'],
        );
      },
    ),
    SupportPage(),
    FavoritesPage(),
    NotificationsPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              MediaQuery.sizeOf(context).width < 600
                  ? MediaQuery.sizeOf(context).height / 40
                  : MediaQuery.sizeOf(context).width < 900
                  ? MediaQuery.sizeOf(context).height / 45
                  : MediaQuery.sizeOf(context).height / 50,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 28 / 40,
                    child: Image.asset(Assets.imagesCreativaLogo2),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('StudentPage');
                      },
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CircleAvatar(
                          child: Image.asset(
                            Assets.imagesTrophy,
                            fit: BoxFit.fill,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Assets.imagesElprofile),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: IndexedStack(
            index: value.CurrentIndex,
            children: [
              value.profile != null && value.profile['data'] != null
                  ? ProfilePage(
                      image:
                          "${value.baseUrl}/${value.profile['data']['image']}" ??
                          Assets.imagesElprofile,
                      name: value.profile['data']['name'],
                      emailorphone: value.profile['data']['email'],
                    )
                  : Center(child: CircularProgressIndicator()),
              SupportPage(),
              FavoritesPage(),
              NotificationsPage(),
              HomePage(),
            ],
          ),
          bottomNavigationBar: Consumer<Control>(
            builder: (context, value, child) {
              return BottomNavigationBar(
                currentIndex: value.CurrentIndex,
                onTap: (val) {
                  value.selected(val);
                },
                iconSize: 28,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: AppColors.Blue,
                unselectedItemColor: AppColors.Black,
                selectedIconTheme: IconThemeData(color: AppColors.Blue),
                unselectedIconTheme: IconThemeData(color: AppColors.Black),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.imagesUser,
                      width: 20,
                      height: 28,
                      color: value.CurrentIndex == 0
                          ? AppColors.Blue
                          : AppColors.Black,
                    ),
                    label: S.of(context).my_account,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.imagesHeadset,
                      width: 20,
                      height: 28,
                      color: value.CurrentIndex == 1
                          ? AppColors.Blue
                          : AppColors.Black,
                    ),
                    label: S.of(context).support,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.imagesHeart,
                      width: 20,
                      height: 28,
                      color: value.CurrentIndex == 2
                          ? AppColors.Blue
                          : AppColors.Black,
                    ),
                    label: S.of(context).favorites,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.imagesBell,
                      width: 20,
                      height: 28,
                      color: value.CurrentIndex == 3
                          ? AppColors.Blue
                          : AppColors.Black,
                    ),
                    label: S.of(context).notifications,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.imagesCreativaLogo2,
                      width: 20,
                      height: 28,
                      color: value.CurrentIndex == 4 ? null : AppColors.Black,
                    ),
                    label: S.of(context).home,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
