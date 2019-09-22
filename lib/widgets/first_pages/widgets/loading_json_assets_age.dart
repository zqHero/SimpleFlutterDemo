import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//加载 json 文件
class LoadingJsonAssetsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoadingJsonAssetsPageState();
  }
}

class LoadingJsonAssetsPageState extends State<LoadingJsonAssetsPage> {
  String _txt = "loading";

  @override
  void initState() {
    super.initState();
    loadTxt();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LoadingJsonAssetsPage"),
      ),
      body: new Center(
        child: new SingleChildScrollView(
          child: new Text(_txt),
        ),
      ),
    );
  }

  Future<String> loadTxt() async {
    var response = await rootBundle.loadString('lib/domain/demo.json');
    setState(() {
      _txt = response.toString();
    });
    return response;
  }
}
