import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lions_flutter/models/event_data/event_data.dart';
import 'package:lions_flutter/models/single_image/single_image.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.eventData, {super.key, this.onTap});

  final EventData eventData;
  final dynamic Function()? onTap;

  DateTime get eventDate => DateTime.parse(eventData.dateTime);
  SingleImage get eventCover => eventData.coverImage;
  String get eventTitle => eventData.title;
  String get eventType => eventData.organizingClub;
  String get eventAddress => eventData.location;
  String get eventContactNumber => eventData.title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            height: 256,
            imageUrl: eventCover.url,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return const Image(
                image: AssetImage('assets/no_image.png'),
              );
            },
            progressIndicatorBuilder: (context, url, progress) =>
                Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.grey[300],
                height: 100,
                width: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "${eventDate.day}-${eventDate.month}-${eventDate.year}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Text(
                    eventTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Text(
                    eventType,
                    style: const TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Text(
                    eventAddress,
                    style: const TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Text(
                    eventContactNumber,
                    style: const TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget loading() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 256,
    );
  }
}
