import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/blocs/EventPageBloc.dart';
import 'package:todoapp/blocs/TaskPageBloc.dart';
import 'package:todoapp/pages/event_page.dart';
import 'package:todoapp/pages/task_page.dart';
import 'package:todoapp/widgets/custome_modal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "Montserrat",
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
  double currentView = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentView = _pageController.page;
      });
    });
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
          showDialog(
              context: context,
              builder: (context) {
                return CustomModal(this.currentView);
              }
          );
        },
        tooltip: 'Add task or event',
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
          Expanded(child:
          PageView(
            controller: _pageController,
              onPageChanged: (page){
                setState(() {
//                  currentView = page;
                });
              },
              children: [
            TaskPage(),
              EventPage()])),

        ],
      ),
    );
  }

  Widget _bottom(context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            color: currentView < 0.5 ? Colors.white : Theme.of(context).accentColor,
            textColor: currentView < 0.5 ? Theme.of(context).accentColor : Colors.white,
            onPressed: () {
              setState(() {
                currentView = 0;
              });
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
            color: currentView > 0.5 ? Colors.white : Theme.of(context).accentColor,
            textColor: currentView > 0.5 ? Theme.of(context).accentColor : Colors.white,
            onPressed: () {
              setState(() {
                currentView = 1;
              });
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
