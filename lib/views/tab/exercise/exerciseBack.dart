import 'package:flutter/material.dart';
import 'package:edot/network/requestServer.dart';
import 'package:dio/dio.dart';
import 'listData.dart';
import 'package:imagebutton/imagebutton.dart';
import 'video/videoSelect.dart';

class exerciseBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: exerciseBody(size),
    );
  }
}


class musucleBtn extends StatelessWidget {
  final int index;
  final Size size;
  final Function func;
  final bool frontOrBack;

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

  const exerciseBody(this.size);

  @override
  Widget build(BuildContext context) {
    List<Widget> ListMusucle=[];
    int i = 0;
    for(i=1;i<=backMusucleData.length;i++){
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context){
                            return GZXDropDownMenuTestPage();
                          }
                      ),
                    );
                  },
                ),
              ),
            ),
          ]
      ),
    );
  }
}