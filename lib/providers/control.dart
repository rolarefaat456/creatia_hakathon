import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hacathon_app/providers/api.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';



class Control extends ChangeNotifier {
  // animation for blue Page and image
  bool shrink = false;
  bool appearance = true;
  bool hidden = false;
  bool showtext = false;
  // 3lshan el loading
  bool isLoading = false;

  // object mn class el api
  Api api = Api();

  late Box tokenbox = Hive.box("token");
  late Box languagebox = Hive.box("settings");
  late Locale locale = const Locale('ar');

  // el url bta3 el back
  String baseUrl =
      'https://lightcoral-giraffe-475787.hostingersite.com/Creativa/public';
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController complain = TextEditingController();
  List<TextEditingController> opts = List.generate(
    4,
    (_) => TextEditingController(),
  );
  TextEditingController current_password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController course_id = TextEditingController();
  TextEditingController college = TextEditingController();
  TextEditingController message = TextEditingController();

  Control() {
    // constructor bystd3y elly b7faz fyha kym el index elly bkon fy fy el bottom navigator bar
    loadCurrentIndex();
  }

  TextEditingController profilename = TextEditingController();
  TextEditingController profilephone = TextEditingController();
  TextEditingController profileemail = TextEditingController();
  TextEditingController profilecity = TextEditingController();

  void initializeControllers() async {
    await profile;
    if (profile != null && profile['data'] != null) {
      profilename.text = profile['data']['name']?.toString() ?? '';
      profilephone.text = profile['data']['phone']?.toString() ?? '';
      profileemail.text = profile['data']['email']?.toString() ?? '';
      profilecity.text = profile['data']['city']?.toString() ?? '';
      notifyListeners();
    }
  }

  void startAnimation() {
    Future.delayed(Duration(milliseconds: 1), () {
      // for be smaller
      shrink = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 2), () {
        // for hidden
        hidden = true;
        notifyListeners();
        // delaying the text after the animation is Finish
        Future.delayed(Duration(milliseconds: 50), () {
          showtext = true;
          notifyListeners();
        });
      });
    });
  }

  setappearance( bool val ){
    appearance = val;
    notifyListeners();
  }

  // selected section home Page
  int selectedindex = 0;
  seclected(int index) {
    selectedindex = index;
    notifyListeners();
  }

  // bottom navegation Bar
  int CurrentIndex = 4;

  BottomNavProvider() {
    loadCurrentIndex(); // bndh el value elly at3mlha save
  }

  selected(int index) {
    CurrentIndex = index;
    notifyListeners();

    final box = Hive.box('settings');
    box.put('currentIndex', index);
  }

  void loadCurrentIndex() {
    final box = Hive.box('settings');
    CurrentIndex = box.get('currentIndex', defaultValue: 4);
    notifyListeners();
  }

  // chart Animation
  int activeIndex = -1;
  selectactiveIndex(index) {
    activeIndex = index;
    notifyListeners();
  }

  IconData iconData = Icons.visibility_off;
  bool obscure = true;
  bool obscure1 = true;
  IconData iconData1 = Icons.visibility_off;

  void isvisibliyoff() {
    if (iconData == Icons.visibility_off) {
      iconData = Icons.visibility;
      obscure = false;
    } else {
      iconData = Icons.visibility_off;
      obscure = true;
    }
    notifyListeners();
  }

  void isvisibliyoff1() {
    if (iconData1 == Icons.visibility_off) {
      iconData1 = Icons.visibility;
      obscure1 = false;
    } else {
      iconData1 = Icons.visibility_off;
      obscure1 = true;
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // register
  var register = null;
  var check;
  String? token;
  Future Register() async {
    check = null;
    setLoading(true);
    Object body = {
      'name': username.text,
      'phone': phone.text,
      'email': email.text,
      'password': password.text,
      'password_confirmation': password_confirmation.text,
      'city': city.text,
    };
    try {
      register = await api.PostApi('$baseUrl/api/register', body);
      print(register);
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    if (register != null && register['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    notifyListeners();
  }

  //vertfy
  var vertfy;
  Future Verify() async {
    check = null;
    setLoading(true);

    String pinCode = opts.map((c) => c.text).join();

    Object body = {'email': email.text, 'otp': pinCode};
    print(email.text);
    print(pinCode);
    try {
      vertfy = await api.PostApi("$baseUrl/api/verify-otp", body);
      print(vertfy);
      if (vertfy != null && vertfy['status'] == true) {
        check = true;
      } else {
        check = false;
      }
      notifyListeners();
    } catch (e) {
      print("Error : $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }



  // login
  var login;
  Future Login() async {
    check = null;
    setLoading(true);

    Object body = {"email": email.text, "password": password.text};

    print(phone);
    print(password);

    try {
      login = await api.PostApi("$baseUrl/api/login", body);
      print(login);
      if (login != null && login['status'] == true) {
      tokenbox.put("token", login['data']['token']);
      // token = login['data']['token'];
      // print(token);
      print("token is ${tokenbox.get("token")}");
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("Error during login: $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    
  }

  // logout

  var logout;

  Future Logout() async {
    check = null;
    setLoading(true);

    Object body = {};


    try {
      logout = await api.postapi2("https://cors-anywhere.herokuapp.com/$baseUrl/api/logout", body, tokenbox.get("token"),);
      print(logout);
      if (logout != null && logout['status'] == true) {
        await tokenbox.delete("token");
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("Error during logout: $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // resendcode

  var resendCode;
  Future ResendCode() async {
    check = null;
    setLoading(true);

    Object body = {'email': email.text};
    try {
      resendCode = await api.PostApi("$baseUrl/api/resend-code", body);
      print(resendCode);
    } catch (e) {
      print("Error : $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    if (resendCode != null && resendCode['status'] == true) {
      check = true;
    } else {
      check = false;
    }

    notifyListeners();
  }

  // forgetPassword

  var forgetPassword;
  Future ForgetPassword() async {
    check = null;
    setLoading(true);

    Object body = {'email': email.text};
    try {
      forgetPassword = await api.PostApi("$baseUrl/api/forget-password", body);
      print(forgetPassword);
      if (forgetPassword != null && forgetPassword['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("Error : $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    
    notifyListeners();
  }

  // forgetPassword

  var reset;
  Future Reset() async {
    check = null;
    setLoading(true);

    Object body = {
      'email': email.text,
      'password': password.text,
      'password_confirmation': password_confirmation.text,
    };
    try {
      reset = await api.PostApi("$baseUrl/api/reset-password", body);
      print(reset);
      if (reset != null && reset['status'] == true) {
        check = true;
      } else {
        check = false;
      }
      notifyListeners();
    } catch (e) {
      print("Error : $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  XFile? _image;
  XFile? get getImage => _image;

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = pickedFile;
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  // get proile

  var profile;
  Future Profile() async {
    print("token profile is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);

    try {
      profile = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/profile",
        tokenbox.get("token"),
        // token!
      );
      if (profile != null && profile['status'] == true) {
        initializeControllers();
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
      print('profile $profile');
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  //updateProfile

  var updateProfile;

  Future UpdateProfile() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);

    String phoneFormatted = profilephone.text.trim();

    if (phoneFormatted.startsWith('0')) {
      phoneFormatted = '+20' + phoneFormatted.substring(1);
    }

    print('Phone formatted: $phoneFormatted');

    Object body = {
      '_method': 'put',
      'name': profilename.text,
      'city': profilecity.text,
      'email': profileemail.text,
      'phone': phoneFormatted,
    };

    print("body: $body");

    try {
      if (_image != null) {
        updateProfile = await api.postapiimage(
          'https://cors-anywhere.herokuapp.com/$baseUrl/api/profile',
          body,
          _image,
          tokenbox.get("token"),
        );
      } else {
        print(username.text);
        updateProfile = await api.postapi2(
          'https://cors-anywhere.herokuapp.com/$baseUrl/api/profile',
          body,
          tokenbox.get("token"),
        );
      }
      print(updateProfile);
      if (updateProfile != null && updateProfile['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
      }
      print("updateProfile $updateProfile");
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  var updatePassword;

  Future UpdatePassword() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);

    Object body = {
      '_method': 'put',
      'current_password': current_password.text,
      'password': password.text,
      'password_confirmation': password_confirmation.text,
    };

    try {
      updatePassword = await api.putapi(
        'https://cors-anywhere.herokuapp.com/$baseUrl/api/profile',
        body,
        tokenbox.get("token"),
      );
      print("updatePassword $updatePassword");
      if (updatePassword != null && updatePassword['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
      }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // get add category

  var getcategory;

  Future AddCategories() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      getcategory = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/categories",
        tokenbox.get("token"),
      );
      print('getcategory $getcategory');
      if (getcategory != null && getcategory['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // get banner

  var getBanner;

  Future GetBanner() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      getBanner = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/banners",
        tokenbox.get("token"),
      );
      print("getBanner $getBanner");
      if (getBanner != null && getBanner['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // allInstractors

  var allInstractors;

  Future AllInstractors() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      allInstractors = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/instractors",
        tokenbox.get("token"),
      );
      print("allInstractors $allInstractors");
      if (allInstractors != null && allInstractors['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // allCourses

  var allCourses;

  Future AllCourses() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      allCourses = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/courses",
        tokenbox.get("token"),
      );
      print("allCourses $allCourses");
      if (allCourses != null && allCourses['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // myCourses

  var myCourses;

  Future MyCourses() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      myCourses = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/my-courses",
        tokenbox.get("token"),
      );
      print("myCourses $myCourses");
      if (myCourses != null && myCourses['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  //reqeustBook

  var reqeustBook;

  Future ReqeustBook() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);

    course_id.text = '2';

    Object body = {
      'course_id': course_id.text,
      'name': username.text,
      'phone': phone.text,
      'email': email.text,
      'city': city.text,
      'college': college.text,
      'age': age.text,
    };

    try {
      reqeustBook = await api.postapi2(
        'https://cors-anywhere.herokuapp.com/$baseUrl/api/request-books',
        body,
        tokenbox.get("token"),
      );
      print("reqeustBook $reqeustBook");
      if (reqeustBook['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // allSections

  var allSections;

  Future AllSections() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      allSections = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/sections",
        tokenbox.get("token"),
      );
      print('allsections is $allSections');
      if (allSections != null && allSections['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // allFavorite

  var allFavorite;

  Future AllFavorite() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      allFavorite = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/favorites",
        tokenbox.get("token"),
      );
      print('allFavorite is $allFavorite');
      if (allFavorite != null && allFavorite['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // addFavorite

  var addFavorite;

  Future AddFavorite({required int id}) async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);

    Object body = {'course_id': id.toString()};

    try {
      addFavorite = await api.postapi2(
        'https://cors-anywhere.herokuapp.com/$baseUrl/api/favorites',
        body,
        tokenbox.get("token"),
      );
      print("addFavorite $addFavorite");
      if (addFavorite != null && addFavorite['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // allNotification

  var allNotification;

  Future AllNotification() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    try {
      allNotification = await api.getapi2(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/notifications",
        tokenbox.get("token"),
      );
      print('allNotification is $allNotification');
      if (allNotification != null && allNotification['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // readNotifications

  var readNotifications;

  Future ReadNotifications({required int id}) async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);
    Object body = {'read': 'true'};
    try {
      readNotifications = await api.putapi(
        "https://cors-anywhere.herokuapp.com/$baseUrl/api/notifications/$id",
        body,
        tokenbox.get("token"),
      );
      print('readNotifications is $readNotifications');
      if (readNotifications != null && readNotifications['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  // addComplain

  var addComplain;

  Future AddComplain() async {
    print("token is ${tokenbox.get("token")}");
    check = null;
    setLoading(true);

    Object body = {'phone': phone.text, 'message': message.text};

    try {
      addComplain = await api.postapi2(
        'https://cors-anywhere.herokuapp.com/$baseUrl/api/complains',
        body,
        tokenbox.get("token"),
      );
      print("addComplain $addComplain");
      if (addComplain != null && addComplain['status'] == true) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  bool isArabic(){
    return Intl.getCurrentLocale() == 'ar';
  }

  // change language
  ChangeLanguage(){
  final newLang = locale.languageCode == 'ar' ? 'en' : 'ar';
  languagebox.put('language', newLang);
  locale = Locale(newLang);
  notifyListeners();
  }

  Future<void> getSavedLanguage() async {
  final savedLang = languagebox.get('language', defaultValue: 'ar');
  locale = Locale(savedLang);
  notifyListeners();
}

}
