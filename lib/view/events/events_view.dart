import 'package:flutter/material.dart';
import 'package:markin/utilities/textstyle.dart';
import 'package:markin/widgets/verified_widget.dart';
import 'package:markin/core/services/event_service.dart';
import 'package:markin/models/event.dart';

class EventsView extends StatefulWidget {
  @override
  _EventsViewState createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    EventService service = EventService();
    return FutureBuilder<List<Event>>(
        future: service.getRecentEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Events by Verified Foundation",
                          style: appBarTextStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.teal,
                          child: Center(
                              child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 12,
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]..addAll(snapshot.data.map<Widget>((data) {
                return VerifiedWidget(
                  data: data,
                );
              })),
          );
        });
  }
}
