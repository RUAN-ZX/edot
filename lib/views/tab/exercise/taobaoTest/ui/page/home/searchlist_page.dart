import 'package:flutter/material.dart';
import '../../../common/model/search.dart';
import '../../../common/services/search.dart';
import '../../../common/style/gzx_style.dart';
import '../../../ui/widget/gzx_searchresult_list_widget.dart';
import '../../../ui/widget/gzx_searchresult_gridview_widget.dart';

class GoodsSortCondition {
  String name;
  bool isSelected;

  GoodsSortCondition({this.name, this.isSelected}) {}
}

class SearchResultListPage<T extends ScrollNotification> extends StatefulWidget {
  final String keyword;
  final bool isList;
  final bool isShowFilterWidget;
  final VoidCallback onTapfilter;
  final NotificationListenerCallback<T> onNotification;
  final bool isRecommended;

  SearchResultListPage(this.keyword,
      {this.isList = false,
      this.onTapfilter,
      this.isShowFilterWidget = false,
      this.onNotification,
      this.isRecommended = false});

  @override
  State<StatefulWidget> createState() => SearchResultListState();
}

class SearchResultListState extends State<SearchResultListPage>
    with AutomaticKeepAliveClientMixin<SearchResultListPage>, SingleTickerProviderStateMixin {
  SearchResultListModal listData = SearchResultListModal([]);
  int page = 0;
  bool _isList;
  bool _isShowMask = false;
  bool _isShowDropDownItemWidget = false;
  GlobalKey _keyFilter = GlobalKey();
  GlobalKey _keyDropDownItem = GlobalKey();

  double _dropDownHeight = 0;
  Animation<double> _animation;
  AnimationController _controller;
  List _filterConditions = ['综合', '信用', '价格降序', '价格升序'];
  var _dropDownItem;
  List<GoodsSortCondition> _goodsSortConditions = [];
  GoodsSortCondition _selectGoodsSortCondition;

  SearchResultListState();

  @override
  void initState() {
//    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    getSearchList(widget.keyword);
    super.initState();

    _isList = widget.isList;

    _controller = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

    _goodsSortConditions.add(GoodsSortCondition(name: '综合', isSelected: true));
    _goodsSortConditions.add(GoodsSortCondition(name: '信用', isSelected: false));
    _goodsSortConditions.add(GoodsSortCondition(name: '价格降序', isSelected: false));
    _goodsSortConditions.add(GoodsSortCondition(name: '价格升序', isSelected: false));

    _selectGoodsSortCondition = _goodsSortConditions[0];
  }

  _afterLayout(_) {
    _getPositions('_keyFilter', _keyFilter);
    _getSizes('_keyFilter', _keyFilter);

    _getPositions('_keyDropDownItem', _keyDropDownItem);
    _getSizes('_keyDropDownItem', _keyDropDownItem);
  }

  _getPositions(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    var positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of $log: $positionRed ");
  }

  _getSizes(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    var sizeRed = renderBoxRed.size;
    print("SIZE of $log: $sizeRed");
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _dropDownItem = ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _goodsSortConditions.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        GoodsSortCondition goodsSortCondition = _goodsSortConditions[index];
        return GestureDetector(
          onTap: () {
            for (var value in _goodsSortConditions) {
              value.isSelected = false;
            }
            goodsSortCondition.isSelected = true;
            _selectGoodsSortCondition = goodsSortCondition;

            _hideDropDownItemWidget();
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
                      color: goodsSortCondition.isSelected ? Colors.red : Colors.black,
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

    var hideWidget = Container(
      color: Colors.red,
      key: _keyDropDownItem,
      child: _dropDownItem,
    );

    var resultWidget = _isList
        ? GZXSearchResultListWidget(listData, getNextPage: () => getSearchList(widget.keyword))
        : GZXSearchResultGridViewWidget(listData, getNextPage: () => getSearchList(widget.keyword));

    if (widget.isRecommended) {
      return resultWidget;
    }

    return Scaffold(
        backgroundColor: GZXColors.mainBackgroundColor,
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              color: Colors.white),
//      color: Colors.red,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  widget.isShowFilterWidget ? _buildFilterWidget() : SizedBox(),
                  Offstage(
                    child: hideWidget,
                    offstage: true,
                  ),
                  Expanded(
                    child: Container(
                        color: _isList ? Colors.white : GZXColors.mainBackgroundColor,
                        child: NotificationListener<ScrollNotification>(
                          onNotification: _onScroll,
                          child: resultWidget,
                        )),
                  ),
                ],
              ),
              _buildDrapDownWidget()
            ],
          ),
        ));
//    );
  }

  bool _onScroll(ScrollNotification scroll) {
    if (widget.onNotification != null) {
      widget.onNotification(scroll);
    }
    // 当前滑动距离
    double currentExtent = scroll.metrics.pixels;
    double maxExtent = scroll.metrics.maxScrollExtent;
//    print('SearchResultListState._onScroll $currentExtent $maxExtent');
    return false;
  }

  Widget _buildDrapDownWidget1() {
    RenderBox renderBoxRed;
    double top = 0;
    if (_dropDownHeight != 0) {
      renderBoxRed = _keyFilter.currentContext.findRenderObject();
      top = renderBoxRed.size.height;
    }

//    print('SearchResultListState._buildDrapDownWidget ${renderBoxRed.size}' );
    return AnimatedPositioned(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,
        top: top,
//    top: 50,
        left: 0,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: _dropDownHeight,
              child: _dropDownItem,
            ),
            _mask()
          ],
        ));
  }

  Widget _buildDrapDownWidget() {
    RenderBox renderBoxRed;
    double top = 0;
    if (_dropDownHeight != 0) {
      renderBoxRed = _keyFilter.currentContext.findRenderObject();
      top = renderBoxRed.size.height;
    }
//    print('SearchResultListState._buildDrapDownWidget ${renderBoxRed.size}' );
    return Positioned(
        width: MediaQuery.of(context).size.width,
        top: top,
//    top: 50,
        left: 0,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
//                color: Colors.white,
//                height: animation.value,
              height: _animation == null ? 0 : _animation.value,

              child: _dropDownItem,
            ),
            _mask()
          ],
        ));
  }

  Widget _mask() {
    if (_isShowMask) {
      return GestureDetector(
        onTap: () {
          _hideDropDownItemWidget();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      );
    } else {
      return Container(
        height: 0,
      );
    }
  }

  void getSearchList(String keyword) async {
    var data = await getSearchResult(keyword, page++);
    SearchResultListModal list = SearchResultListModal.fromJson(data);
    if (mounted) {
      setState(() {
        listData.data.addAll(list.data);
      });
    }
  }

  _showDropDownItemWidget() {
    final RenderBox dropDownItemRenderBox = _keyDropDownItem.currentContext.findRenderObject();

//    _dropDownHeight = dropDownItemRenderBox.size.height;
    _dropDownHeight = 160;
    _isShowDropDownItemWidget = !_isShowDropDownItemWidget;
    _isShowMask = !_isShowMask;

    _animation = new Tween(begin: 0.0, end: _dropDownHeight).animate(_controller)
      ..addListener(() {
        //这行如果不写，没有动画效果
        setState(() {});
      });

    if (_animation.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  _hideDropDownItemWidget() {
    _isShowDropDownItemWidget = !_isShowDropDownItemWidget;
    _isShowMask = !_isShowMask;
    _controller.reverse();
  }

  Widget _buildFilterWidget() {
    return Column(
      key: _keyFilter,
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    _showDropDownItemWidget();
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        _selectGoodsSortCondition.name,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                      Icon(
                        !_isShowDropDownItemWidget ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: Colors.red,
                      )
                    ],
                  ),
                )),
            Text('销量', style: TextStyle(fontSize: 14)),
            Row(
              children: <Widget>[Text('视频 ', style: TextStyle(fontSize: 14)), Icon(GZXIcons.video, size: 14)],
            ),
            GestureDetector(
              onTap: () {
                print('_isList = !_isList');
                setState(() {
                  _isList = !_isList;
                });
              },
              child: Container(
//                color: Colors.red,
                width: 36,
                height: 34,
                child: Icon(
                  _isList ? GZXIcons.list : GZXIcons.cascades,
                  size: 18,
                ),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: <Widget>[Text('筛选', style: TextStyle(fontSize: 14)), Icon(GZXIcons.filter, size: 16)],
                ),
              ),
              onTap: widget.onTapfilter,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
