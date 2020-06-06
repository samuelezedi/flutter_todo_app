import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Icon(Icons.fiber_manual_record, size: 20,
                    color: Theme.of(context).accentColor,
            ),
            Text('08.00'),
            Container(
              padding: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [BoxShadow(
                  color: Color(0x20000000),
                  blurRadius: 5,
                  offset: Offset(0,3)
                )]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Coffee with Sam'),
                  SizedBox(height: 12,),
                  Text('Personal')
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
