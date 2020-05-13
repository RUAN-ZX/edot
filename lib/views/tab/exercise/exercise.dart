import 'package:flutter/material.dart';
import 'package:edot/network/requestServer.dart';
import 'package:dio/dio.dart';
import 'listData.dart';

import 'package:imagebutton/imagebutton.dart';
class exercise extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
//    final width =size.width;
//    final height =size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(Icons.menu,color: Colors.white,),
          onPressed: (){
            print('menu hitted');

          },
        ),
        title: Text("选择肌肉锻炼部分",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: exerciseBody(size),
    );
  }

}
class exerciseBody extends StatelessWidget{
  final size;
  const exerciseBody(this.size);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 10, 10),
        child:Row(
          children: <Widget>[
            Expanded(
              child: new Stack(
                children: <Widget>[
//                  new Image.asset("asset/images/back/b.png",width: double.infinity,fit: BoxFit.cover,),
                  new Positioned(
                      left:0.0,
                      right: 0.0,
                      top: 0.0,
                      child: ImageButton(
                        children: <Widget>[],
                        width: size.width/4,
                        height: size.height/4,
                        paddingTop: 5,
                        pressedImage: Image.asset(
                          "asset/images/back/b_back.png",
                        ),
                        unpressedImage: Image.asset("asset/images/back/b_back2.png"),
                        onTap: () {
                          print('test');
                        },
                      )
                      )
                  ]
//                      Image.asset(,width: double.infinity,fit: BoxFit.cover,),,
                ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child:SizedBox(
                width: size.width/4,
  //              height: 22,
                child: new OutlineButton(
                  borderSide:new BorderSide(color: Theme.of(context).primaryColor),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
  //                  child: new Text('注册\n234\n234',style: new TextStyle(color: Theme.of(context).primaryColor),),
                    child: RichText(
                      text: TextSpan(
  //                      text: '本人同意领取赠险并许可保险公司沟通赠险生效事宜,已阅读',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        children: <TextSpan>[
                          TextSpan(
                              text: '背阔肌\n',
                              style:TextStyle(color: Color(0xFF008EFF), fontSize: 13,fontWeight: FontWeight.bold),
  //                            recognizer: TapGestureRecognizer()
  //                              ..onTap = () async {
  //                                AgreementDialog.showActivityDialog(context);
  //                              }
                                ),
                          TextSpan(
                              text: 'latissimus dorsi位于腰背部和胸部后外侧皮下，为全身最大的阔肌，',
                              style:TextStyle(color: Color(0xFF008EFF), fontSize: 13),
  //                            recognizer: TapGestureRecognizer()
  //                              ..onTap = () async {
  //                                AgreementDialog.showSecurityDialog(context);
  //                              }
                            ),
                        ],
                      ),
                    )
                  ),
                  onPressed: (){},
                ),
              ),
            ),
        ]
    ),
    );
//            new Image.asset("asset/images/back/b.png",width: 140),


//        new ListView(
//          children: <Widget>[
//            Text("背阔肌"),
//            Text("背阔肌简介"),
//          ],
//        ),
  }
}


//  List<Widget> _getListData() {
//    var tempList=listData.map((value){
//      return Container(
//        child:Column(
//          children: <Widget>[
//            Image.network(value['imageUrl']),
//            SizedBox(height: 12),
//            Text(
//              value['title'],
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                  fontSize: 20
//              ),
//            )
//          ],
//
//        ),
//        decoration: BoxDecoration(
//
//            border: Border.all(
//                color:Color.fromRGBO(233, 233,233, 0.9),
//                width: 1
//            )
//        ),
//
//        // height: 400,  //设置高度没有反应
//      );
//
//    });
//    // ('xxx','xxx')
//    return tempList.toList();
//  }


//  @override
//  Widget build(BuildContext context) {
//    return GridView.count(
//      crossAxisSpacing:0.0 ,   //水平子 Widget 之间间距
//      mainAxisSpacing: 0.0,    //垂直子 Widget 之间间距
//      padding: EdgeInsets.all(10),
//      crossAxisCount: 5,  //一行的 Widget 数量
//      // childAspectRatio:0.7,  //宽度和高度的比例
//      children: this._getListData(),
//    );
//  }
//}

//class exerciseBody extends StatefulWidget {
//  @override
//  _exerciseBodyState createState() => _exerciseBodyState();
//}
//
//class _exerciseBodyState extends State<exerciseBody> {
//  var result;
//  @override
//  void initState() {
//    super.initState();
//
//    FormData formData = FormData.fromMap({
//      "mId": "40",
////      "age": 25,
////      "file": await MultipartFile.fromFile("./text.txt",filename: "upload.txt"),
////      "files": [
////        await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
////        await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
////      ]
//    });
//    /// 自己封装的 兼容各种类型的请求
//    /// 注意 post方式要传 FormData格式的postdata
//    /// get方式 如果有url参数 要传 Map<String,dynamic>的queryParams
//    HttpRequest.request("getMessage/",method: "post",postdata: formData).then((res){
//      setState(() {
//        this.result = res;
//      });//这里 一旦访问完成立刻幅值 立刻让其他人通过result拿到值！
//      final a = this.result.data['msUserId'];
////      print(a);
//    });
//
//    HttpRequest.request("getMessage/",method: "get").then((res){
//      setState(() {
//        this.result = res;
//      });
//      final a = this.result.data;
////      print(a);
//    });
//
//
//  }
//  @override
//  Widget build(BuildContext context) {
//    return GridView(
//      scrollDirection: Axis.vertical,
//      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//        maxCrossAxisExtent: 100, //子控件最大宽度为100
//        childAspectRatio: 1.0,//宽高比为1:2
//        crossAxisSpacing: 10,
//        mainAxisSpacing: 10,
//      ),
//      padding: EdgeInsets.all(10),
//      children: List.generate(
//        20,
//            (index) {
//          return null;
//        },
//      ),
//    );
//
//  }
//}
