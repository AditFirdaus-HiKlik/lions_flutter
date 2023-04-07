import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/Data/AppException.dart';
import 'package:lions_flutter/Data/EventData.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/api/network.dart';
import 'package:lions_flutter/api/rest_api.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeEvents extends StatefulWidget {
  const HomeEvents({super.key});

  @override
  State<HomeEvents> createState() => _HomeEventsState();
}

class _HomeEventsState extends State<HomeEvents> {
  List<EventData> _data = [];
  int _currentPage = 1;
  ScrollController _controller = ScrollController();

  late final ValueNotifier<List<EventData>> _selectedEvents =
      ValueNotifier(_getEventsForDay(_focusedDay));
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Future<List<EventData>> _fetchData() async {
    String endpoint = getEndpoint();
    endpoint += 'api/events';
    endpoint += '?';

    endpoint += "populate=*&";

    if (!(await isConnectedToInternet())) {
      throw AppException(code: 1, message: "No Internet Connection");
    }

    try {
      final response = await RestAPI.get(Uri.parse(endpoint));

      List<EventData> newData = [];

      var body = json.decode(response.body);
      var data = body['data'];

      for (var data in data) {
        newData.add(EventData.fromJson(data));
      }

      setState(() {
        _data.addAll(newData);
      });
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(code: 0, message: "Unknown Error");
    }

    return _data;
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  List<EventData> _getEventsForDay(DateTime day) {
    return _data.where((event) {
      DateTime eventTime = event.attributes.datetime;
      final eventDay = DateTime(eventTime.year, eventTime.month, eventTime.day);
      return isSameDay(day, eventDay);
    }).toList();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              TableCalendar<EventData>(
                // Indonesia
                locale: 'id_ID',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                onDaySelected: _onDaySelected,
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              _buildHeader(),
              ValueListenableBuilder<List<EventData>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return AnimationLimiter(
                        child: AnimationConfiguration.staggeredList(
                          position: index,
                          child: ScaleAnimation(
                            scale: 0.5,
                            child: FadeInAnimation(
                              child: _buildEventCard(value[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ]));
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Event Calendar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(EventData eventData) {
    DateTime eventDate = eventData.attributes.datetime;
    SingleImage? eventCover = eventData.attributes.coverImage;
    String eventTitle = eventData.attributes.title;
    String eventType = eventData.attributes.type;
    String eventAddress = eventData.attributes.address;
    String eventContactNumber = eventData.attributes.contactNumber;

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

  // Widget _buildNewsCard(ArticleData articleDatas) {
  //   String articleTitle = articleDatas.attributes.title;
  //   SingleImage articleCover = articleDatas.attributes.coverImage;

  //   return ZoomTapAnimation(
  //     end: 1.05,
  //     beginDuration: const Duration(milliseconds: 100),
  //     onTap: () {
  //       // Using bottom sheet to show the news
  //       Navigator.push(
  //         context,
  //         CupertinoPageRoute(
  //           builder: (context) => NewsViewPage(
  //             articleDatas,
  //           ),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
  //       height: 256,
  //       clipBehavior: Clip.antiAlias,
  //       decoration: BoxDecoration(
  //         color: Colors.black,
  //         borderRadius: BorderRadius.circular(16),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.2),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //             offset: const Offset(0, 3),
  //           ),
  //         ],
  //       ),
  //       child: Stack(
  //         alignment: AlignmentDirectional.bottomStart,
  //         fit: StackFit.expand,
  //         children: [
  //           CachedNetworkImage(
  //             imageUrl: articleCover.url,
  //             fit: BoxFit.cover,
  //             errorWidget: (context, url, error) {
  //               return const Image(
  //                 image: AssetImage('assets/no_image.png'),
  //               );
  //             },
  //             progressIndicatorBuilder: (context, url, progress) =>
  //                 Shimmer.fromColors(
  //               baseColor: Colors.grey[300]!,
  //               highlightColor: Colors.grey[100]!,
  //               child: Container(
  //                 color: Colors.grey[300],
  //                 height: 100,
  //                 width: 100,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //                 colors: [
  //                   Colors.transparent,
  //                   Colors.black.withOpacity(0.5),
  //                 ],
  //               ),
  //             ),
  //             height: 64,
  //           ),
  //           Align(
  //             alignment: AlignmentDirectional.bottomStart,
  //             child: Padding(
  //               padding: const EdgeInsetsDirectional.all(16),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(
  //                     articleTitle,
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize:
  //                           Theme.of(context).textTheme.titleMedium!.fontSize,
  //                     ),
  //                   ),
  //                   Text(
  //                     articleDatas.attributes.author,
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize:
  //                           Theme.of(context).textTheme.labelMedium!.fontSize,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
