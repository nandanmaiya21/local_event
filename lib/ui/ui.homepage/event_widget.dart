import 'package:flutter/material.dart';
import 'package:local_event/styleguide.dart';
import '../../model/event.dart';
import 'package:marquee/marquee.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                event.imagePath,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: eventTitleCategoryTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              if (event.location.length <= 20)
                                Text(
                                  event.location,
                                  style: eventLocationTextStyle,
                                ),
                              if (event.location.length > 20)
                                Container(
                                  height: 20,
                                  width: 205,
                                  child: Marquee(
                                    text: event.location,
                                    style: eventLocationTextStyle,
                                    scrollAxis: Axis.horizontal,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    blankSpace: 20.0,
                                    velocity: 100.0,
                                    pauseAfterRound: Duration(seconds: 1),
                                    startPadding: 10.0,
                                    accelerationDuration: Duration(seconds: 1),
                                    accelerationCurve: Curves.linear,
                                    decelerationDuration:
                                        Duration(milliseconds: 500),
                                    decelerationCurve: Curves.easeOut,
                                  ),
                                )
                            ],
                          )
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration.toUpperCase(),
                      textAlign: TextAlign.right,
                      style: eventLocationTextStyle.copyWith(
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
