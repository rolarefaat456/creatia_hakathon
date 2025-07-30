import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/componant/jointed_widgets/bottom_nav_bar.dart';
import 'package:hacathon_app/componant/jointed_widgets/home_appbar.dart';
import 'package:hacathon_app/componant/utils/app_colors.dart';
import 'package:hacathon_app/prov/control.dart';
import 'package:hacathon_app/view/widgets/favourite_courses.dart/Favorites_Page.dart';
import 'package:hacathon_app/view/widgets/notifications/Notifications_Page.dart';
import 'package:hacathon_app/view/widgets/support/SupportPage.dart';
import 'package:hacathon_app/view/widgets/home/home_page.dart';
import 'package:hacathon_app/view/widgets/profile/profile_page.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  final List<Widget> pages = [
  ProfilePage(),
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
              MediaQuery.sizeOf(context).width<600?
              MediaQuery.sizeOf(context).height/40
              :MediaQuery.sizeOf(context).width<900?
              MediaQuery.sizeOf(context).height/45
              :MediaQuery.sizeOf(context).height/50
            ),
            child: HomeAppbar(),),
          body: IndexedStack(
            index: value.CurrentIndex,
            children: [
              ProfilePage(),
              SupportPage(),
              FavoritesPage(),
              NotificationsPage(),
              HomePage(),
            ],),
            bottomNavigationBar: BottomNavBar(),
          );
      },
    );
  }
}