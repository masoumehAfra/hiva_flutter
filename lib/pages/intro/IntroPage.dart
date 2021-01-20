import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

 List list = json.decode('[{"image":"aa","text":"slm"},{"image":"bb","text":"hi"},{"image":"cc","text":"slm"}]');

 PageController _controller=PageController();
 var initialPage=0;

  @override
  Widget build(BuildContext context) {
   _controller.addListener(() {
     setState(() {
       initialPage =_controller.page.round();
     });
   });
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _appBar(),
            _body(_controller),
            //_indicator(),
            _buildCircleIndicator()
          ],
        ),
      ),
    );
  }

  _appBar(){

    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              if(initialPage > 0){
                _controller.animateToPage(initialPage - 1,duration: Duration(microseconds: 500), curve: Curves.easeIn);
              }
            },
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.all(
                      Radius.circular(15)
                  ),
                ),
                child:Icon(Icons.arrow_back_ios)
            ),
          ),
          FlatButton(
            onPressed: (){
              if(initialPage < list.length){
                _controller.animateToPage(list.length,duration: Duration(microseconds: 500), curve: Curves.easeIn);
              }
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black
              ),
            ),
          )

        ],
      ),
    );
  }

  _body(PageController controller){

    return Expanded(
        child: PageView.builder(
          controller: controller,
           itemCount: list.length,
        onPageChanged: (int index){
          _currentPageNotifier.value = index;
        },
        itemBuilder:(context ,index){
              return Column(
                children: <Widget>[
               index == 1
                  ? _displayText(list[index]["text"]) :_displayImage(list[index]["image"]),

                  SizedBox(
                    height: 25,
                  ),
                  index == 1
                      ?_displayImage(list[index]["image"]):_displayText(list[index]["text"]) ,
                ],
              );
        }));
  }

  _displayImage(String path){
    return  Image.asset("assets/images/$path.png",
    height: MediaQuery.of(context).size.height * .5,);
  }

  _displayText(String text){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
    );
  }

  // _indicator(){
  //   return Container(
  //     width: 90,
  //     height: 90,
  //     margin: EdgeInsets.symmetric(vertical: 12),
  //  child: Stack(
  //    children: <Widget>[
  //      Align(
  //        alignment: Alignment.center,
  //        child: Container(
  //          width: 90,
  //          height: 90,
  //          child: CircularProgressIndicator(
  //            valueColor: AlwaysStoppedAnimation(Colors.purple),
  //            value:( initialPage +1) /(list.length +1),
  //          ),
  //        ),
  //      ),
  //      Align(
  //        alignment: Alignment.center,
  //        child: GestureDetector(
  //          onTap: (){
  //            if(initialPage < list.length){
  //              _controller.animateToPage(initialPage + 1,duration: Duration(microseconds: 500), curve: Curves.easeIn);
  //            }
  //          },
  //          child: Container(
  //            width: 65,
  //            height: 65,
  //            decoration: BoxDecoration(
  //                color: Colors.purple,
  //                borderRadius: BorderRadius.all(
  //                    Radius.circular(100)
  //                )
  //            ),
  //            child: Icon(
  //              Icons.arrow_forward_ios,
  //              color: Colors.white,
  //            ),
  //          ),
  //        ),
  //      )
  //    ],
  //  ),
  //   );
  // }

 _buildCircleIndicator() {
   return Positioned(
     left: 0.0,
     right: 0.0,
     bottom: 0.0,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: CirclePageIndicator(
         itemCount: list.length,
         currentPageNotifier: _currentPageNotifier,
       ),
     ),
   );
 }
 final _currentPageNotifier = ValueNotifier<int>(0);

}