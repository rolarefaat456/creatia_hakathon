import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacathon_app/prov/control.dart';
import 'package:hacathon_app/view/view_page.dart';
import 'package:hacathon_app/view/widgets/Student_Progress/last_courses.dart';
import 'package:hacathon_app/view/widgets/Student_Progress/student_page.dart';
import 'package:hacathon_app/view/widgets/home/home_page.dart';
import 'package:hacathon_app/view/widgets/onboard.dart/onboard.dart';
import 'package:hacathon_app/view/widgets/profile/edit_profile_view.dart';
import 'package:hacathon_app/view/widgets/profile/profile_page.dart';
import 'package:hacathon_app/view/widgets/signin/confirmation_login.dart';
import 'package:hacathon_app/view/widgets/signin/create_new_password.dart';
import 'package:hacathon_app/view/widgets/signin/enter_confirmation_password.dart';
import 'package:hacathon_app/view/widgets/signin/loginpage.dart';
import 'package:hacathon_app/view/widgets/signin/reset_password.dart';
import 'package:hacathon_app/componant/jointed_widgets/signinappbar.dart';
import 'package:hacathon_app/view/widgets/signin/signinpage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([ // bysht8l by el tol bs
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(
    // dir.path
  );
  await Hive.openBox('settings');
  await Hive.openBox('token');
  runApp(
      ChangeNotifierProvider(create: (context) => Control(),
      child:  DevicePreview(
        enabled: true,
      builder: (context) {
        return MyApp();
})
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: StudentPage(),
      initialRoute: 'Onboard',
      routes: {
        'Onboard' : (context) => Onboard(),
        'SigninPage' : (context) => Signinpage(),
        'ViewPage' : (context) => ViewPage(),
        'Login' : (context) => Loginpage(),
        'ConfirmationLogin' : (context) => ConfirmationLogin(),
        'ResetPassword' : (context) => ResetPassword(),
        'EnterConfirmationPassword' : (context) => EnterConfirmationPassword(),
        'CreateNewPassword' : (context) => CreateNewPassword(),
        'HomePage' : (context) => HomePage(),
        'ProfilePage' : (context) => ProfilePage(),
        'EditProfileView' : (context) => EditProfileView(),
        'StudentPage' : (context) => StudentPage()
      },
    );
  }
}

