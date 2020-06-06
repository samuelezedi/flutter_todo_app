import 'package:flutter/material.dart';
import 'package:todoapp/blocs/EventPageBloc.dart';
import 'package:todoapp/services/icon_decoration.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final List<Event> eventList = [
    new Event('08:00' , 'Call Samuel about appointment', 'Personal', false),
    new Event('10:00' , 'Meet with sales', 'Personal', true),
    new Event('12:00' , 'Call Tom about appointment', 'Personal', false),
    new Event('14:00' , 'Fix onboarding experience', 'Personal', false),
    new Event('16:00' , 'Edit API documentation', 'Personal', false),
    new Event('18:00' , 'set up user focus group', 'Personal', false),
  ];

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Container(
              decoration: IconDecoration(
                  iconSize: iconSize,
                  lineWidth: 1,
                  firstData: index == 0 ?? true,
                  lastData: index == eventList.length - 1 ?? true),
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
                  eventList[index].isFinish ? Icons.fiber_manual_record : Icons.radio_button_unchecked,
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

