import 'package:flutter/material.dart';
import 'package:todoapp/services/icon_decoration.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Container(
              decoration: IconDecoration(
                  iconSize: iconSize,
                  lineWidth: 1,
                  firstData: true,
                  lastData: false),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          color: Color(0x20000000),
                          blurRadius: 5)
                    ]),
                child: Icon(
                  Icons.fiber_manual_record,
                  size: iconSize,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            Container(
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('08.00'),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x20000000),
                            blurRadius: 5,
                            offset: Offset(0, 3))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Coffee with Sam'),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Personal')
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

