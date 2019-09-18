### flutter 第三方库的使用  及  网络请求：
 
 打开https://pub.dartlang.org  搜索 url_launcher.
 
 打开项目 pubspec.yaml 在dependencies 下添加 依赖：
 
 ``` dependencies:
   flutter:
     sdk: flutter
   url_launcher: ^5.1.2
 ```

使用 :
```
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//使用一个  包资源： 仓库地址：https:pub.dartlang.org    url_launcher 的使用：======
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text('第三方包示例'),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('打开百度'),
            onPressed: () {
              const url = 'https://www.baidu.com';
              launch(url);
            }),
      ),
    ));
  }
} //运行  一个app 程序
```

### 网络请求：

两种请求方式：
1，http  2, httpClient

示例：

```aidl
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';

void main() => runApp(MyApp2());

//使用 http 发起一个网络请求：===========================================
//使用一个  包资源： 仓库地址：https:pub.dartlang.org    url_launcher 的使用：======
class MyApp2 extends StatelessWidget {
  //请求  天气数据
  getWeatherData() async {
    try {
      // 两个  uri 都可以请求    第二个添加参数可以：
      Uri uri1 = Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100");
      Uri uri2 = Uri(
          scheme: "https",
          host: "t.weather.sojson.com",
          queryParameters: {
            "_id": "26",
            "city_code": "101030100",
            "city_name": "天津"
          });   //需要配置 证书  否则握手异常

      //实例化 一个  httpClient对象   创建个 请求  对象
      HttpClient client = new HttpClient();
      //  建立连接  并请求
      HttpClientRequest request = await client.getUrl(uri2);
      HttpClientResponse response = await request.close();
      // 使用utf-8  从response 中解析返回数据：
      var result = await response.transform(utf8.decoder).join();
      print("打印 请求回来的数据:" + result);
      client.close();
    } catch (e) {
      print("请求失败--== $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text('第三方包示例'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            //发起一个  httpClient 请求：
            new RaisedButton(
              onPressed: () {
                getWeatherData();
              },
              child: new Text('点击获取天气信息'),
            ),

            // 发起一个  http 请求：
            new RaisedButton(
              onPressed: () {
                var url = 'http://httpbin.org/';
                http.get(url).then((response) {
                  print("状态: + ${response.statusCode}");
                  print("正文: + ${response.body}");
                });
              },
              child: new Text('发起http请求'),
            ),

            //打开百度 示例
            new RaisedButton(
                child: new Text('打开百度'),
                onPressed: () {
                  const url = 'https://www.baidu.com';
                  launch(url);
                }),
          ],
        ),
      ),
    ));
  }
} //运行  一个app 程序
```

