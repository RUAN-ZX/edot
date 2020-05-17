import 'tools/MyMath.dart';
import 'tools/changeEnum.dart';

//具体的页面调用转换enum 1 2 3 变成字符串的函数显示出来就好
/// 兼容cardView显示 或者videoPlay显示
class VideoItem{
  VideoItem({this.title,this.views,this.likes,this.time,this.duration,
  this.cover,this.id,this.author,this.avatar,
    this.location,this.tool,this.goal, this.musucle,this.difficulty});
  String title;// 标题
  int views;// 播放量
  int likes;//点赞量
  int comment;
  String time;// 上传时间
  String duration;// 时长 duration

  String cover;// 封面图片src
  String id;// 视频Id 服务器那边的
  String author;// 作者
  String avatar;// 作者头像路径

  int location;// 地点
  int tool;// 锻炼器材
  int goal;// 目标 比如练腰 练腿等等
  int musucle;// 具体肌肉部位
  int difficulty;// 难易程度

}