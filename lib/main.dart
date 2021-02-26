import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MaterialApp(
    home: mybrowser(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
         primarySwatch: Colors.green
         ),
  ));
}

class mybrowser extends StatefulWidget {
  @override
  _mybrowserState createState() => _mybrowserState();
}

class _mybrowserState extends State<mybrowser> {

  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.google.com/";


  launchUrl(){
    setState(() {
          urlString = controller.text;
          flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override

  void initState(){
    super.initState();
    FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs){
          print(wvs.type);
          });
        }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
                title: Center(child:TextField(
                              autofocus: true,
                              controller: controller,
                              cursorColor: Colors.blue,
                              cursorWidth: 0.3,
                              textInputAction: TextInputAction.go,
                              onSubmitted: (url)=> launchUrl(),
                              style: TextStyle(
                                    color: Colors.white
                                    ),
                              decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type Url Here",
                                      hintStyle: TextStyle(
                                                color: Colors.white
                                               ) ,
                                           ),
                                ),

                            ),
                backgroundColor: Colors.green,
                actions:  [
                            IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () =>launchUrl(),
                            )
                        ],
                ),
      url: urlString,
      withZoom: true,

    );
  }
}

