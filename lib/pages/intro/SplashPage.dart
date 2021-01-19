import 'package:flutter/material.dart';
import 'package:hiva/arthitecture/abstract_views/splash_view.dart';
import 'package:hiva/arthitecture/presenters/splash_presenter.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>  implements SplashView{

  SplashPresenter _presenter;
  _SplashPageState(){
    _presenter=new SplashPresenter(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter.getConnectionInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }

  @override
  onErroe(error) {
    // TODO: implement onErroe

  }

  @override
  onGetSplashInfo(response) {
    // TODO: implement onGetSplashInfo

  }
}
