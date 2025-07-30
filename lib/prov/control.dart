import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class Control extends ChangeNotifier {

  // animation for blue Page and image
  bool shrink = false;
  bool hidden = false;
  bool showtext = false;

  Control() { // constructor bystd3y elly b7faz fyha kym el index elly bkon fy fy el bottom navigator bar
    loadCurrentIndex();
  }

  void startAnimation() {
    Future.delayed(Duration(milliseconds: 1), () { // for be smaller
      shrink = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 2), () { // for hidden
        hidden = true;
        notifyListeners();
        // delaying the text after the animation is Finish
        Future.delayed(Duration(milliseconds: 50), () {
          showtext = true;
          notifyListeners();
        },);
      });
    });
  }

  // selected section home Page
  int selectedindex = 0;
  seclected(int index){
    selectedindex = index;
    notifyListeners();
  }

  // bottom navegation Bar
  int CurrentIndex = 4;

  BottomNavProvider() {
    loadCurrentIndex(); // bndh el value elly at3mlha save
  }

  selected( int index )
  {
    CurrentIndex = index;
    notifyListeners();

    final box = Hive.box('settings');
    box.put('currentIndex', index);
  }

  void loadCurrentIndex() {
    final box = Hive.box('settings');
    CurrentIndex = box.get('currentIndex', defaultValue: 4); // تحميل القيمة
    notifyListeners();
  }

  // chart Animation
  int activeIndex = -1;
  selectactiveIndex(index){
    activeIndex = index;
    notifyListeners();
  }

}