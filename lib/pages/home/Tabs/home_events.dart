import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/api/models/lions_collection.dart';
import 'package:lions_flutter/models/event_data/event_data.dart';
import 'package:lions_flutter/widgets/event_card.dart';
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
              renderContents(),
            ]));
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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

  Widget renderContents() {
    return FutureBuilder<List<EventData>>(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return buildCard(snapshot.data![index], index);
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return _buildLoadingView();
      },
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
          return buildCardLoading(index);
        },
      ),
    );
  }

  Widget buildCard(EventData eventData, int index) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: index,
        child: ScaleAnimation(
          scale: 1.25,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
          child: FadeInAnimation(
            child: EventCard(eventData),
          ),
        ),
      ),
    );
  }

  Widget buildCardLoading(int index) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: index,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
          child: FadeInAnimation(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: EventCard.loading(),
            ),
          ),
        ),
      ),
    );
  }
}
