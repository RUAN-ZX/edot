import 'package:flutter/material.dart';
import 'package:edot/network/requestServer.dart';
import 'package:dio/dio.dart';
import 'listData.dart';
import 'package:edot/views/tab/exercise/test.dart';
import 'package:imagebutton/imagebutton.dart';



class exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context){
              return exercisePage();
            }
        ),
    );
//    Navigator.of(context).pushAndRemoveUntil(
//        new MaterialPageRoute(
//            builder: (context) => new exercisePage()),
//            (route) => route == null);
  }
}


class exercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
//    final width =size.width;
//    final height =size.height;
    // TODO: implement build
    return MaterialApp(
      title: "易点健身",
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
//          highlightColor: Colors.transparent,
//          splashColor: Colors.transparent
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: new Icon(Icons.menu, color: Colors.white,),
            onPressed: () {
              print('menu hitted');
            },
          ),
          title: Text("选择肌肉锻炼部分", style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: exerciseBody(size),
      ),
      // MyStackPage就是我们的核心页面 用scaffold 构建页面
    );
  }

}


class musucleBtn extends StatelessWidget {
  final int index;
  final Size size;
//  final double y;
//  final double width;
//  final double height;
//  final String btnSrcPressed;
//  final String btnSrcUnPressed;
  final Function func;
  final bool frontOrBack;

  //"asset/images/back/b_back.png"
  const musucleBtn(
      this.index,
      this.frontOrBack,
      this.size,
      this.func,);
  @override
  Widget build(BuildContext context) {
    String btnSrc = '';
    if (frontOrBack) {
      btnSrc = 'asset/images/front/';
    }
    else {
      btnSrc = 'asset/images/back/';
    }
    double factor = 2/3;
    return new Positioned(
      //true front False=back

        left: backMusucleData[index - 1]['x']*size.width*factor,
        top: backMusucleData[index - 1]['y']*size.height,
        child: ImageButton(
          children: <Widget>[],
          width: backMusucleData[index - 1]['width']*size.width*factor,
          height: backMusucleData[index - 1]['height']*size.height,
          paddingTop: 5,
          pressedImage: Image.asset(
              btnSrc + backMusucleData[index - 1]['btnSrcPressed']),
          unpressedImage: Image.asset(
              btnSrc + backMusucleData[index - 1]['btnSrcUnPressed']),
          onTap: (){
            print("2333");
          },
        )
    );
  }
}

class exerciseBody extends StatelessWidget {
  final Size size;

  Function printR(value) {
    print("${value}肌");
  }

//  final List<String> BtnSrc = [
//    "asset/images/back/b_back.png",
//    "asset/images/back/b_back.png",
//    "asset/images/back/b_back.png"
//    "asset/images/back/b_back.png"
//
//  ];
  const exerciseBody(this.size);

  @override
  Widget build(BuildContext context) {
    List<Widget> ListMusucle=[];
    int i = 0;
    for(i=2;i<=backMusucleData.length;i++){
      ListMusucle.add(musucleBtn(i, false, size, printR));
    }
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 10, 10),
      child: Row(
          children: <Widget>[
            Expanded(
              child: new Stack(children: ListMusucle),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: SizedBox(
                width: size.width / 4,
                //              height: 22,
                child: new OutlineButton(

                  borderSide: new BorderSide(color: Theme
                      .of(context)
                      .primaryColor),
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          children: <TextSpan>[
                            TextSpan(
                              text: '背阔肌\n',
                              style: TextStyle(color: Color(0xFF008EFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'latissimus dorsi位于腰背部和胸部后外侧皮下，为全身最大的阔肌，',
                              style: TextStyle(color: Color(0xFF008EFF),
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      )
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (context) => new test()),
                            (route) => route == null);
                  },
                ),
              ),
            ),
          ]
      ),
    );
  }
}