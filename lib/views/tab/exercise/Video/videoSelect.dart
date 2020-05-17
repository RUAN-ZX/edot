import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'gzx_filter_goods_page.dart';
import 'videoCard.dart';


class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}

class GZXDropDownMenuTestPage extends StatefulWidget {
  @override
  _GZXDropDownMenuTestPageState createState() => _GZXDropDownMenuTestPageState();
}

class _GZXDropDownMenuTestPageState extends State<GZXDropDownMenuTestPage> {
  List<String> _dropDownHeaderItemStrings = ['综合排序', '目的', '地点', '器械', '筛选'];
  List _SortConditions0 = [
    '综合排序',
    '点赞排序',
    '时间排序',
    '点击量排序',
  ];

  List _SortConditions0_second = [
    '升序',
    '降序',
  ];
  List<SortCondition> _SortConditions1 = [];
  List<SortCondition> _SortConditions2 = [];
  List<SortCondition> _SortConditions3 = [];

  SortCondition _selectSortCondition1;
  SortCondition _selectSortCondition2;
  SortCondition _selectSortCondition3;
  GZXDropdownMenuController _dropdownMenuController = GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 目的
    _SortConditions1.add(SortCondition(name: '练腿', isSelected: true));
    _SortConditions1.add(SortCondition(name: '练腰', isSelected: false));
    _SortConditions1.add(SortCondition(name: '练胸', isSelected: false));
    _SortConditions1.add(SortCondition(name: '练背', isSelected: false));
    _SortConditions1.add(SortCondition(name: '练腹肌', isSelected: false));
    _selectSortCondition1 = _SortConditions1[0];

    //地点
    _SortConditions2.add(SortCondition(name: '健身房', isSelected: true));
    _SortConditions2.add(SortCondition(name: '家', isSelected: false));
    _SortConditions2.add(SortCondition(name: '运动场', isSelected: false));
    _selectSortCondition2 = _SortConditions2[0];


    //器械
    _SortConditions3.add(SortCondition(name: '跑步机', isSelected: true));
    _SortConditions3.add(SortCondition(name: '瑜伽垫', isSelected: false));
    _SortConditions3.add(SortCondition(name: '杠铃', isSelected: false));
    _selectSortCondition3 = _SortConditions3[0];

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // 添加搜索框！
      appBar: PreferredSize(
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,

          ),
          preferredSize: Size.fromHeight(0)),
      backgroundColor: Colors.white,
      endDrawer: GZXFilterGoodsPage(),
      body:
      Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                // 搜索框高度设置
                width: MediaQuery.of(context).size.width,
                height: 44,
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  '搜索框',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
//              SizedBox(height: 20,),
              // 下拉菜单头部
              GZXDropDownHeader(
                // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                items: [
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[2]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[3]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[4], iconData: Icons.filter_frames, iconSize: 18),
                ],
                // GZXDropDownHeader对应第一父级Stack的key
                stackKey: _stackKey,
                // controller用于控制menu的显示或隐藏
                controller: _dropdownMenuController,
                // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                onItemTap: (index) {
                  if (index == 4) {
                    _dropdownMenuController.hide();
                    _scaffoldKey.currentState.openEndDrawer();
                  }
                },
              ),
// 插入ListView！
            SizedBox(
              height: size.height-40.0-75.0,
              child: RecommendPage(),
            ),
//            Expanded(
//
//            )
            ],
          ),

          // 下拉菜单
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 500,
            // 下拉后遮罩颜色
//          maskColor: Theme.of(context).primaryColor.withOpacity(0.5),
//          maskColor: Colors.red.withOpacity(0.5),
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions0.length+10.0,
                  dropDownWidget: _buildAddressWidget((selectValue) {
                    _dropDownHeaderItemStrings[0] = selectValue;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions1.length+10.0,
                  dropDownWidget: _buildConditionListWidget(_SortConditions1, (value) {
                    _selectSortCondition1 = value;
                    _dropDownHeaderItemStrings[1] =
                    _selectSortCondition1.name == '全部' ? '目的' : _selectSortCondition1.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions2.length+10.0,
                  dropDownWidget: _buildConditionListWidget(_SortConditions2, (value) {
                    _selectSortCondition2 = value;
                    _dropDownHeaderItemStrings[2] =
                    _selectSortCondition2.name == '全部' ? '地点' : _selectSortCondition2.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions3.length+10.0,
                  dropDownWidget: _buildConditionListWidget(_SortConditions3, (value) {
                    _selectSortCondition3 = value;
                    _dropDownHeaderItemStrings[3] =
                    _selectSortCondition3.name == '全部' ? '器械' : _selectSortCondition3.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
            ],
          ),


        ],
      ),
    );
  }

  int _selectTempFirstLevelIndex = 0;
  int _selectFirstLevelIndex = 0;
  int _selectSecondLevelIndex = -1;

  _buildAddressWidget(void itemOnTap(String selectValue)) {
//    List firstLevels = new List<int>.filled(15, 0);
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: ListView(
            children: _SortConditions0.map((item) {
              int index = _SortConditions0.indexOf(item);
              return GestureDetector(
                onTap: () {
                  _selectTempFirstLevelIndex = index;
                  setState(() {});
                },
                child: Container(
                    height: 40,
                    color: _selectTempFirstLevelIndex == index ? Colors.grey[200] : Colors.white,
                    alignment: Alignment.center,
                    child: _selectTempFirstLevelIndex == index
                        ? Text(
                      '$item',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                        : Text('$item')),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: _selectTempFirstLevelIndex == 0
                ? Container()
                : ListView(
              children: _SortConditions0_second.map((item) {
                int index = _SortConditions0_second.indexOf(item);
                return GestureDetector(
                    onTap: () {
                      _selectSecondLevelIndex = index;

                      _selectFirstLevelIndex = _selectTempFirstLevelIndex;
                      itemOnTap(item);
//                      itemOnTap(firstLevels[_selectFirstLevelIndex]);
//                      if (_selectSecondLevelIndex == 0) {
//                        itemOnTap(firstLevels[_selectFirstLevelIndex]);
//                      } else {
//                        itemOnTap(item);
//                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: Row(children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        _selectFirstLevelIndex == _selectTempFirstLevelIndex && _selectSecondLevelIndex == index
                            ? Text(
                          '$item',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                            : Text('$item'),
                      ]),
                    ));
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  _buildConditionListWidget(items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        SortCondition goodsSortCondition = items[index];
        return GestureDetector(
          onTap: () {
            for (var value in items) {
              value.isSelected = false;
            }
            goodsSortCondition.isSelected = true;

            itemOnTap(goodsSortCondition);
          },
          child: Container(
//            color: Colors.blue,
            height: 40,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    goodsSortCondition.name,
                    style: TextStyle(
                      color: goodsSortCondition.isSelected ? Theme.of(context).primaryColor : Colors.black,
                    ),
                  ),
                ),
                goodsSortCondition.isSelected
                    ? Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                )
                    : SizedBox(),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
