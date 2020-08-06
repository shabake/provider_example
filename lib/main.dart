import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_manager.dart';

void main() => runApp(
      ChangeNotifierProvider<ThemeManager>(
        create: (_) {
          return ThemeManager(ThemeType.light);
        },
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeManager>(context, listen: true).themeData,
      home: GHomePage(),
    );
  }
}

class GHomePage extends StatefulWidget {
  @override
  _GHomePageState createState() => _GHomePageState();
}

class _GHomePageState extends State<GHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GHThemeManager"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "点击悬浮button切换主题",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            Text(
              "${Provider.of<ThemeManager>(context, listen: true).themeType != ThemeType.light ? "默认" : "暗黑"}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ThemeManager>(context, listen: false).changeTheme();
          },
          child: Icon(Icons.home)),
    );
  }
}
