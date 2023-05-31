import 'package:flutter/material.dart';
import 'package:local_event/styleguide.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';
import '../../model/guest.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Event event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 8),
            child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.keyboard_backspace)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
            child: FittedBox(
              child: Row(children: [
                Text(
                  '-',
                  style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  event.location,
                  style: eventLocationTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "GUEST",
              style: guestTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (final guest in guests)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipOval(
                    child: Image.asset(
                      guest.imagePath,
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: event.punchLine1,
                style: punchLine1TextStyle,
              ),
              TextSpan(
                text: event.punchLine2,
                style: punchLine2TextStyle,
              ),
            ])),
          ),
          if (event.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                event.description,
                style: eventLocationTextStyle,
              ),
            ),
          if (event.galleryImages != null)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
              child: Text(
                "GALLERY",
                style: guestTextStyle,
              ),
            ),
          if (event.galleryImages != null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (final galleryImagePath in event.galleryImages!)
                  Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        galleryImagePath,
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ]),
            ),
        ],
      ),
    );
  }
}
