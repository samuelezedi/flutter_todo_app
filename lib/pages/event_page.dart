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
            Column(
              children: <Widget>[

              ],
            )
          ],
        );
      },
    );
  }
}
