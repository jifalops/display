import 'package:display/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
          builder: (context, constraints) => ListView(
                children: [
                  DisplayExample(constraints),
                  TextField(),
                ],
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DisplayExample extends StatefulWidget {
  const DisplayExample(this.constraints);
  final BoxConstraints constraints;
  @override
  _DisplayExampleState createState() => _DisplayExampleState();
}

class _DisplayExampleState extends State<DisplayExample> {
  MediaQueryData media;
  DisplayArea mediaArea;
  DisplayArea widgetArea;

  void _update() => widgetArea = DisplayArea(
      height: widget.constraints.maxHeight, width: widget.constraints.maxWidth);

  String _size(Size s) => '${s.width.round()}x${s.height.round()}';

  @override
  void initState() {
    _update();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    media = MediaQuery.of(context);
    mediaArea = DisplayArea(height: media.size.height, width: media.size.width);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(DisplayExample oldWidget) {
    if (oldWidget.constraints != widget.constraints) _update();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Media (${_size(media.size)}): ${mediaArea.type}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Columns: ${widgetArea.columns}'),
              Text('Margins: ${widgetArea.margins}'),
              Text('Gutters: ${widgetArea.gutters}'),
              Text('Column Width: ${widgetArea.columnWidth.round()}'),
              Text('Two-Column Width: ${widgetArea.doubleColumnWidth.round()}'),
              Text('Pixel ratio: ${media.devicePixelRatio}'),
              Text('Text scale factor: ${media.textScaleFactor}'),
              Text('Orientation: ${media.orientation}'),
              Text('Platform brightness: ${media.platformBrightness}'),
              Text('Padding: ${media.padding}'),
              Text('Gesture insets: ${media.systemGestureInsets}'),
              Text('View insets: ${media.viewInsets}'),
              Text('View padding: ${media.viewPadding}'),
            ],
          ),
        ),
        ListTile(
          title: Text(
              'Widget (${_size(widget.constraints.biggest)}): ${widgetArea.type}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Columns: ${widgetArea.columns}'),
              Text('Margins: ${widgetArea.margins}'),
              Text('Gutters: ${widgetArea.gutters}'),
              Text('Column Width: ${widgetArea.columnWidth.round()}'),
              Text('Two-Column Width: ${widgetArea.doubleColumnWidth.round()}'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widgetArea.gutters),
          child: Wrap(
            spacing: widgetArea.margins,
            runSpacing: widgetArea.margins,
            children: [
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: widgetArea.doubleColumnWidth,
              ),
            ],
          ),
        )
      ],
    );
  }
}
