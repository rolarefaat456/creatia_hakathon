import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:hacathon_app/views/view_page.dart';
import 'package:hacathon_app/views/widgets/Student_Progress/student_page.dart';
import 'package:hacathon_app/views/widgets/home/home_page.dart';
import 'package:hacathon_app/views/widgets/onboard.dart/onboard.dart';
import 'package:hacathon_app/views/widgets/profile/edit_profile_view.dart';
import 'package:hacathon_app/views/widgets/signin/confirmation_login.dart';
import 'package:hacathon_app/views/widgets/signin/create_new_password.dart';
import 'package:hacathon_app/views/widgets/signin/enter_confirmation_password.dart';
import 'package:hacathon_app/views/widgets/signin/loginpage.dart';
import 'package:hacathon_app/views/widgets/signin/reset_password.dart';
import 'package:hacathon_app/views/widgets/signin/signinpage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox('settings');
  final control = Control();
  await control.getSavedLanguage();
  await FlutterLocalization.instance.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    // bysht8l by el tol bs
    DeviceOrientation.portraitUp,
  ]);
  // Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(
    // dir.path
  );
  await Hive.openBox('settings');
  await Hive.openBox('token');
  runApp(
    ChangeNotifierProvider.value(
      value: control,
      // create: (context) => Control(),
      child: DevicePreview(
        enabled: true,
        builder: (context) {
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return MaterialApp(
          locale: value.locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          // home: StudentPage(),
          initialRoute: 'Onboard',
          routes: {
            'Onboard': (context) => Onboard(),
            'SigninPage': (context) => Signinpage(),
            'ViewPage': (context) => ViewPage(),
            'Login': (context) => Loginpage(),
            'ConfirmationLogin': (context) => ConfirmationLogin(),
            'ResetPassword': (context) => ResetPassword(),
            'EnterConfirmationPassword': (context) => EnterConfirmationPassword(),
            'CreateNewPassword': (context) => CreateNewPassword(),
            'HomePage': (context) => HomePage(),
            'EditProfileView': (context) => EditProfileView(),
            'StudentPage': (context) => StudentPage(),
          },
        );
      }
    );
  }
}
