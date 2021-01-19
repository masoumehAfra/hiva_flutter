import 'package:flutter/cupertino.dart';

class SplashProvider extends ChangeNotifier{


  bool _tryAgainStatusBar=false;
  bool get getTryAgainStatusBar=>_tryAgainStatusBar;
  updateTryAgainStatusBar(bool val){
    _tryAgainStatusBar=val;
    notifyListeners();
  }

}