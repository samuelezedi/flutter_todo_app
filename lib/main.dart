import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

        primarySwatch: Colors.red,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
          children: [
            Container(
              height: 35,
              color: Theme.of(context).accentColor,
            ),
            Positioned(
              right: 0,
              child: Text('6', style: TextStyle(
                  fontSize: 200, color: Color(0x10000000)
              ),),
            ),
            _mainContent(context),
          ]
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {

              },
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SafeArea _mainContent(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Monday', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _bottom(context),
          ),
          _taskUnComplete(context, 'Call Samuel about appointment'),
          _taskUnComplete(context, 'Fix onboarding experience'),
          _taskUnComplete(context, 'Edit API documents'),
          _taskUnComplete(context, 'Setup user focus group'),
          Divider(

          ),
          SizedBox(height: 16,),
          _taskComplete(context, 'Have coffee with Sam'),
          _taskComplete(context, 'Meet with sales'),
        ],
      ),
    );
  }

  Padding _taskUnComplete(BuildContext context, String text) {
    return Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 24),
            child: Row(
              children: <Widget>[
                Icon(
                    Icons.radio_button_unchecked,
                    color: Theme.of(context).accentColor,
                  size: 20,
                ),
                SizedBox(width: 28,),
                Text(text)
              ],
            ),
          );
  }

  Padding _taskComplete(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 24),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.radio_button_checked,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(width: 28,),
          Text(text)
        ],
      ),
    );
  }

  Widget _bottom(context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () {

            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.all(14.0),
            child: Text('Tasks'),
          ),
        ),
        SizedBox(width: 32,),
        Expanded(
          child: MaterialButton(
            color: Colors.white,
            textColor: Theme.of(context).accentColor,
            onPressed: () {

            },
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Theme.of(context).accentColor
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.all(14.0),
            child: Text('Events'),
          ),
        )
      ],
    );
  }
}
