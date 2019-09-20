import 'package:flutter/material.dart';

const tabTextStyle = TextStyle(
  fontSize: 2,
  color: Colors.red,
  fontWeight: FontWeight.w100,
);

class ItemView {
  final int index;
  final Text title;
  final IconData icon;

  const ItemView({this.index, this.title, this.icon});
}

//item
const List<ItemView> _items = const <ItemView>[
  ItemView(
      index: 0,
      title: const Text('GitPros', style: tabTextStyle),
      icon: Icons.airplay),
  ItemView(
      index: 1,
      title: const Text('Widget', style: tabTextStyle),
      icon: Icons.alternate_email),
  ItemView(
      index: 2,
      title: const Text('Layout', style: tabTextStyle),
      icon: Icons.directions_boat),
  ItemView(
      index: 3,
      title: const Text('GestureDetector', style: tabTextStyle),
      icon: Icons.directions_bus),
  ItemView(
      index: 4,
      title: const Text('火车', style: tabTextStyle),
      icon: Icons.directions_railway),
  ItemView(
      index: 5,
      title: const Text('步行', style: tabTextStyle),
      icon: Icons.directions_walk),
];

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new DefaultTabController(
          length: _items.length,
          child: new Scaffold(
//            backgroundColor: Colors.white,
            appBar: new TabBar(
              indicatorColor: Colors.blue, //选中时下划线颜色,如果使用了indicator这里设置无效
              labelColor: Colors.blue,
              isScrollable: true,  //设置可以滚动
              tabs: _items.map((ItemView item) {
                return new Tab(
                  text: item.title.data,
                  icon: new Icon(item.icon),
                );
              }).toList(),
            ),
            body: new TabBarView(
              children: _items.map((ItemView item) {
                return new Padding(
                  padding: const EdgeInsets.all(3),
                  child: getItemView(item),
//                  new SelectedView(item: item),
                );
              }).toList(),
            ),
          )),
    );
  }

  Widget getItemView(ItemView item) {
    List<_ItemList> _items = <_ItemList>[];
    switch (item.index) {
      case 1:
        //Widget 列表
        _items = <_ItemList>[
          _ItemList("AlertDialog", "AlertDialogPage", Icon(Icons.keyboard)),
          _ItemList("Table", "TablePage", Icon(Icons.print)),
        ];
        break;
      case 2:
        //Layout 列表
        _items = <_ItemList>[
          //列表
          _ItemList("GridView", "GridViewPage", Icon(Icons.keyboard)),
          _ItemList("Table", "TablePage", Icon(Icons.print)),

          //基本 布局类
          _ItemList("Align对齐布局", "AlignPage", Icon(Icons.widgets)),
          _ItemList("FittedBox缩放布局", "FittedBoxPage", Icon(Icons.print)),
          _ItemList("StackAlignment布局", "StackAlignmentPage", Icon(Icons.home)),
          _ItemList(
              "StackPositioned布局", "StackPositionedPage", Icon(Icons.widgets)),
          _ItemList("IndexedStack布局", "IndexedStackPage", Icon(Icons.map)),
          _ItemList("OverflowBox布局", "OverflowBoxPage", Icon(Icons.keyboard)),
          //限制宽高
          _ItemList("SizedBox限制", "SizedBoxPage", Icon(Icons.title)),
          _ItemList("ConstranedBox限制", "ConstranedBoxPage", Icon(Icons.print)),
          _ItemList("LimitedBox限制", "LimitedBoxPage", Icon(Icons.widgets)),
          _ItemList("AspectRatio调整宽高比", "AspectRatioPage", Icon(Icons.home)),
          _ItemList("FractionallySizedBox调整宽高比", "FractionallySizedBoxPage",
              Icon(Icons.map)),
          //
          _ItemList("Wrap自动换行布局", "WrapPage", Icon(Icons.title)),
          //整合 demo
          _ItemList("LayoutDemo", "AllLayoutDemoPage", Icon(Icons.add)),
        ];
        break;
      case 3:
        //手势  列表
        _items = <_ItemList>[
          _ItemList("GestureDetectorPage手势检测", "GestureDetectorPage",
              Icon(Icons.widgets)),
          _ItemList(
              "Dissmissible滑动删除", "DissmissiblePage", Icon(Icons.widgets)),
        ];
        break;
      default:
        return new Card();
    }
    return new ListPage(items: _items);
  }
}

class ListPage extends StatelessWidget {
  List<_ItemList> items = <_ItemList>[];

  ListPage({this.items});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizedBox.expand(
      child: new ListView(
        children: items.map((_ItemList item) {
          return new Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.zero,
            child: ListTile(
              leading: item.icon,
              title: new Text("${item.title}"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "${item.route}");
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ItemList {
  final String title;
  final String route;
  final Icon icon;

  _ItemList(this.title, this.route, this.icon);
}

//定义视图类
class SelectedView extends StatelessWidget {
  final item;

  const SelectedView({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Scaffold(
//      backgroundColor: Colors.grey[300],
      body: new Card(
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min, //垂直方向最小化处理
            crossAxisAlignment: CrossAxisAlignment.center, //水平方向居中对齐
            children: <Widget>[
              new Icon(item.icon, size: 128, color: textStyle.color),
              new Text(item.title.data, style: textStyle)
            ],
          ),
        ),
      ),
    );
  }
}
