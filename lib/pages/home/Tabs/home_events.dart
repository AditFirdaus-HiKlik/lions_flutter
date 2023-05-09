import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/api/models/article.dart';
import 'package:lions_flutter/models/event_data/event_data.dart';
import 'package:lions_flutter/models/single_image/single_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeEvents extends StatefulWidget {
  const HomeEvents({super.key});

  @override
  State<HomeEvents> createState() => _HomeEventsState();
}

class _HomeEventsState extends State<HomeEvents> {
  List<EventData> data = [];

  late final ValueNotifier<List<EventData>> _selectedEvents =
      ValueNotifier(_getEventsForDay(_focusedDay));

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late LionsCollection collection;

  Future<List<EventData>> _fetchData() async {
    Map<String, String> parameters = {'populate': '*'};

    var result = await collection.fetch(parameters: parameters);

    data = [];

    for (dynamic item in result['data']) {
      var article = _processItem(item);
      data.add(article);
    }

    return data;
  }

  EventData _processItem(item) {
    item.addAll(item['attributes']);
    item.remove('attributes');

    item['coverImage'].addAll(item['coverImage']['data']);
    item['coverImage'].remove('data');

    item['coverImage'].addAll(item['coverImage']['attributes']);
    item['coverImage'].remove('attributes');

    var article = EventData.fromJson(item);

    return article;
  }

  @override
  void initState() {
    super.initState();

    collection = LionsCollection();
    collection.path = '/events';
  }

  List<EventData> _getEventsForDay(DateTime day) {
    return data.where((event) {
      DateTime eventTime = DateTime.parse(event.dateTime);
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
              _renderCards(),
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

  Widget _renderCards() {
    return FutureBuilder<List<EventData>>(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              EventData article = snapshot.data![index];
              return AnimationLimiter(
                child: AnimationConfiguration.staggeredList(
                  position: index,
                  child: ScaleAnimation(
                    scale: 1.25,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    child: FadeInAnimation(
                      child: _buildEventCard(article),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return _buildLoadingView();
      },
    );
  }

  Widget _buildEventCard(EventData eventData) {
    DateTime eventDate = DateTime.parse(eventData.dateTime);
    SingleImage eventCover = eventData.coverImage;
    String eventTitle = eventData.title;
    String eventType = eventData.organizingClub;
    String eventAddress = eventData.location;
    String eventContactNumber = eventData.title;

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

  Widget _buildLoadingView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimationLimiter(
            child: AnimationConfiguration.staggeredList(
              position: index,
              child: FlipAnimation(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutExpo,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    child: Container(
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
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
