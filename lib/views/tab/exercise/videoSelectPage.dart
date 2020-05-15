import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'taobaoTest/ui/page/drawer/gzx_filter_goods_page.dart';
import 'test.dart';
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
  List<String> _dropDownHeaderItemStrings = ['综合','目的', '地点', '器械', '筛选'];
  List<SortCondition> _SortConditions1 = [];
  List<SortCondition> _SortConditions2 = [];
  List<SortCondition> _SortConditions3 = [];
  List<SortCondition> _SortConditions4 = [];
  List<SortCondition> _SelectSortConditions = [];

  GZXDropdownMenuController _dropdownMenuController = GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    /// 后面想办法封装一下！！！


    _SortConditions1.add(SortCondition(name: '综合评价', isSelected: true));
    _SortConditions1.add(SortCondition(name: '点赞数升序', isSelected: false));
    _SortConditions1.add(SortCondition(name: '点赞数降序', isSelected: false));
    _SelectSortConditions[1] = _SortConditions1[0];

    _SortConditions2.add(SortCondition(name: '练腹', isSelected: true));
    _SortConditions2.add(SortCondition(name: '练背', isSelected: false));
    _SortConditions2.add(SortCondition(name: '练腿', isSelected: false));
    _SortConditions2.add(SortCondition(name: '练腰', isSelected: false));
    _SelectSortConditions[2] = _SortConditions2[0];

    _SortConditions3.add(SortCondition(name: '跑步机', isSelected: true));
    _SortConditions3.add(SortCondition(name: '瑜伽垫', isSelected: false));
    _SortConditions3.add(SortCondition(name: '杠铃', isSelected: false));
    _SelectSortConditions[3] = _SortConditions3[0];

    _SortConditions4.add(SortCondition(name: '家', isSelected: true));
    _SortConditions4.add(SortCondition(name: '健身房', isSelected: false));
    _SortConditions4.add(SortCondition(name: '体育场', isSelected: false));
    _SelectSortConditions[4] = _SortConditions4[0];

  }

  @override
  Widget build(BuildContext context) {
//    print('_GZXDropDownMenuTestPageState.build');

    return Scaffold(
      endDrawer: GZXFilterGoodsPage(),
      key: _scaffoldKey,
      appBar: PreferredSize(
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(0)),
      backgroundColor: Colors.white,
      body: Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 44,
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  '搜索',
                  //可以搜索特定的运动名字
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
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
//                // 头部的高度
//                height: 40,
//                // 头部背景颜色
//                color: Colors.red,
//                // 头部边框宽度
//                borderWidth: 1,
//                // 头部边框颜色
//                borderColor: Color(0xFFeeede6),
//                // 分割线高度
//                dividerHeight: 20,
//                // 分割线颜色
//                dividerColor: Color(0xFFeeede6),
//                // 文字样式
//                style: TextStyle(color: Color(0xFF666666), fontSize: 13),
//                // 下拉时文字样式
//                dropDownStyle: TextStyle(
//                  fontSize: 13,
//                  color: Theme.of(context).primaryColor,
//                ),
//                // 图标大小
//                iconSize: 20,
//                // 图标颜色
//                iconColor: Color(0xFFafada7),
//                // 下拉时图标颜色
//                iconDropDownColor: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: 100,
                    separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: ListTile(
                          leading: Text('test$index'),
                        ),
                        onTap: () {},
                      );
                    }),
              ),
            ],
          ),
          // 下拉菜单
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 300,
            // 下拉后遮罩颜色
//          maskColor: Theme.of(context).primaryColor.withOpacity(0.5),
//          maskColor: Colors.red.withOpacity(0.5),
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
//              GZXDropdownMenuBuilder(
//                  dropDownHeight: 40 * _SortConditions1.length,
//                  dropDownWidget: _buildAddressWidget((selectValue) {
//                    _dropDownHeaderItemStrings[0] = selectValue;
//                    _dropdownMenuController.hide();
//                    setState(() {});
//                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions1.length,
                  dropDownWidget: _buildConditionListWidget(_SortConditions2, (value) {
                    _SelectSortConditions[1] = value;
                    _dropDownHeaderItemStrings[1] =
                    _SelectSortConditions[1].name == '综合评价' ? '综合评价' : _SelectSortConditions[1].name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions2.length,
                  dropDownWidget: _buildConditionListWidget(_SortConditions2, (value) {
                      _SelectSortConditions[2] = value;
                    _dropDownHeaderItemStrings[2] = '???';
//                    _selectSortConditions2.name == '全部123' ? '品牌321' : _selectSortConditions2.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions3.length,
                  dropDownWidget: _buildConditionListWidget(_SortConditions3, (value) {
                    _SelectSortConditions[3] = value;
                    _dropDownHeaderItemStrings[3] = "3???";
//                    _dropDownHeaderItemStrings[3] = _SelectSortConditions[3].name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _SortConditions4.length,
                  dropDownWidget: _buildConditionListWidget(_SortConditions4, (value) {
                    _SelectSortConditions[4] = value;
                    _dropDownHeaderItemStrings[4] = "4???";
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
    List firstLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return '全部';
      }
      return '$index区';
    });

    List secondLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return '全部';
      }
      return '$_selectTempFirstLevelIndex$index街道办';
    });

    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: ListView(
            children: firstLevels.map((item) {
              int index = firstLevels.indexOf(item);
              return GestureDetector(
                onTap: () {
                  _selectTempFirstLevelIndex = index;

                  if (_selectTempFirstLevelIndex == 0) {
                    itemOnTap('全城');
                    return;
                  }
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
              children: secondLevels.map((item) {
                int index = secondLevels.indexOf(item);
                return GestureDetector(
                    onTap: () {
                      _selectSecondLevelIndex = index;
                      _selectFirstLevelIndex = _selectTempFirstLevelIndex;
                      if (_selectSecondLevelIndex == 0) {
                        itemOnTap(firstLevels[_selectFirstLevelIndex]);
                      } else {
                        itemOnTap(item);
                      }
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
