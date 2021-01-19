import 'package:flutter/material.dart';
import 'package:hiva/utils/StaticData.dart';

class MySnackBar{

  void getSnackBar(_globalKey,message){
   _globalKey.currentState.showSnackBar(SnackBar(content: Text(message,textDirection: TextDirection.rtl,
     style: TextStyle(fontFamily: "BYEKAN",color: Colors.black87,fontWeight: FontWeight.bold),),backgroundColor: StaticData.snackBarColor,)) ;
 }

}


