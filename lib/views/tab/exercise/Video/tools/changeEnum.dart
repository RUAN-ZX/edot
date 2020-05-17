import 'dart:math';

//int location;// 地点
//int tool;// 锻炼器材
//int goal;// 目标 比如练腰 练腿等等
//int musucle;// 具体肌肉部位
//int difficulty;// 难易程度


List ListStringData=[
  ['健身房','家里','运动场'],
  ['杠铃','跑步机','瑜伽垫','','','',''],
  ['练腹肌','练胸肌','瘦腿','练手臂'],
  [
    '斜方肌上中部','三角肌前束','肱二头肌','前臂肌','胸肌','腹肌','股外侧肌','小腿三头肌',
    '斜方肌下部','三角肌中后束','肱三头肌','前臂肌','背肌','腰肌','股外侧肌','小腿三头肌',
    '臀中肌','臀大肌',
  ],
  ['简单','一般','较难','困难','挑战','极限'],

];

List toListString(List listInt){
  List listString = [];
  var i =0;
  for(i=0;i<=4;i++){
    listString.add(ListStringData[i][ listInt[i] ]);
  }
  return listString;
}

String toNumString(int num){
  return num>10000?(num~/10000).toString()+"万":num.toString();
}

///秒数 转 时：分：秒
String durationtoString(int duration) {
  if (duration >= 3600) {
    return (duration ~/ 3600 < 10
        ? "0${duration ~/ 3600}"
        : "${duration ~/ 3600}") +
        ":" +
        ((duration ~/ 60) % 60 < 10
            ? "0${(duration ~/ 60) % 60}"
            : "${(duration ~/ 60) % 60}") +
        ":" +
        (duration % 60 < 10 ? "0${duration % 60}" : "${duration % 60}");
  } else {
    return ((duration ~/ 60) % 60 < 10
        ? "0${(duration ~/ 60) % 60}"
        : "${(duration ~/ 60) % 60}") +
        ":" +
        (duration % 60 < 10 ? "0${duration % 60}" : "${duration % 60}");
  }
}


///生成随机字符串
String getrandomhash() {
String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
int strlenght = 30;

/// 生成的字符串固定长度
String left = '';
  for (var i = 0; i < strlenght; i++) {
  // right = right + (min + (Random().nextInt(max - min))).toString();
  left = left + alphabet[Random().nextInt(alphabet.length)];
  }
  return left;
}