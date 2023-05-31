import 'package:flutter/material.dart';
import 'package:local_event/app_state.dart';
import 'package:local_event/model/category.dart';
import 'package:local_event/model/event.dart';
import 'package:local_event/styleguide.dart';
import 'package:local_event/ui/ui.event_details/event_details_page.dart';
import 'package:provider/provider.dart';
import '../ui.homepage/home_page_background.dart';
import '../ui.homepage/category_widget.dart';
import './event_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<Appstate>(
        create: (_) => Appstate(),
        child: Stack(
          children: [
            HomePageBackGround(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "LOCAL EVENTS",
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "What's Up",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Consumer<Appstate>(
                        builder: (ctx, appState, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final category in categories)
                                CategoryWidget(category: category),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer<Appstate>(
                        builder: (ctx, appState, _) => Column(
                          children: [
                            for (final event in events.where((e) {
                              var select = appState.getSelectedCategoryId;
                              return e.categoryIds!.contains(select);
                            }))
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (ctx) => EventDetailsPage(
                                                  event: event,
                                                )));
                                  },
                                  child: EventWidget(event: event)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
