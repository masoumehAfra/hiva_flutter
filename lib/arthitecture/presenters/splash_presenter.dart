import 'package:hiva/arthitecture/abstract_views/splash_view.dart';
import 'package:hiva/arthitecture/models/splash_model.dart';

class SplashPresenter {

  SplashModel _model=new SplashModel();
  SplashView _view;

  SplashPresenter(SplashView view){
    _view=view;
  }

  void getConnectionInfo(){
    _model.getConnectionInfo().then((response) => _view.onGetSplashInfo(response))
        .catchError((onError)=>_view.onErroe(onError));
  }



}