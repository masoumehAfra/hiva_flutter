import 'package:hiva/arthitecture/data/network/api.dart';

class SplashModel{

  Future<dynamic> getConnectionInfo(){
    return NetWorkApi().getConnectionInfo();
  }
}