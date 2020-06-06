import 'package:flutter/material.dart';

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

class IconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;

  IconDecoration({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
}) : this.iconSize = iconSize, this.lineWidth = lineWidth, this.firstData = firstData, this.lastData = lastData;

  @override
  BoxPainter createBoxPainter([onChanged]) {
    // TODO: implement createBoxPainter
    return IconLine(
      iconSize: iconSize,
      lineWidth: lineWidth,
      firstData: firstData,
      lastData: lastData
    );
  }
  
}

class IconLine extends BoxPainter {

  final double iconSize;
  final bool firstData;
  final bool lastData;

  final Paint paintLine;

  IconLine({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  }) : this.iconSize = iconSize, this.firstData = firstData, this.lastData = lastData, paintLine = Paint()
  ..color = Colors.red
  ..strokeCap = StrokeCap.round
  ..strokeWidth = lineWidth
  ..style = PaintingStyle.stroke;


  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    final leftOffset = Offset((iconSize / 2), offset.dy);
    final double iconSpace = iconSize / 1.5;
    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));
    final Offset centerTop = configuration.size.centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconSpace));
    final Offset centerBottom = configuration.size.centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconSpace));
    final Offset end = configuration.size.centerLeft(Offset(leftOffset.dx, (leftOffset.dy * 2)));
    canvas.drawLine(top, centerTop, paintLine);
    canvas.drawLine(centerBottom, end, paintLine);
  }
  
}
