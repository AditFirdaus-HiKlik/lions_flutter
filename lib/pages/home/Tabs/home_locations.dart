import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/api/models/LionsCollection.dart';
import 'package:lions_flutter/api/network.dart';
import 'package:lions_flutter/api/rest_api.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:lions_flutter/models/location_data/location_data.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeLocations extends StatefulWidget {
  const HomeLocations({super.key});

  @override
  State<HomeLocations> createState() => _HomeLocationsState();
}

class _HomeLocationsState extends State<HomeLocations> {
  late LionsCollection _collection;

  Future<List<LocationData>> _fetchData() async {
    Map<String, String> parameters = {'populate': '*'};

    dynamic result = await _collection.fetch(parameters: parameters);

    List<LocationData> data = [];

    for (dynamic item in result['data']) {
      var article = _processItem(item);
      data.add(article);
    }

    return data;
  }

  LocationData _processItem(item) {
    item.addAll(item['attributes']);
    item.remove('attributes');

    var article = LocationData.fromJson(item);

    return article;
  }

  @override
  void initState() {
    super.initState();

    _collection = LionsCollection();
    _collection.path = '/locations';
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
            _renderCards(),
          ]),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Locations',
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
    return FutureBuilder<List<LocationData>>(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              LocationData article = snapshot.data![index];
              return AnimationLimiter(
                child: AnimationConfiguration.staggeredList(
                  position: index,
                  child: ScaleAnimation(
                    scale: 1.25,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    child: FadeInAnimation(
                      child: _buildLocationCard(article),
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

  Widget _buildLoadingView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 15,
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

  Widget _buildLocationCard(LocationData locationData) {
    return ZoomTapAnimation(
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
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
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  launchUrlString(locationData.link,
                      mode: LaunchMode.externalApplication);
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.directions,
                label: 'Direction',
              ),
              SlidableAction(
                onPressed: (context) {
                  launchUrlString("tel:${locationData.contactNumber}");
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.call,
                label: 'Call',
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Text(
                    locationData.title,
                    style: const TextStyle(
                      color: Color(0xFF2D3436),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Icon(
                          Icons.location_pin,
                          color: Color(0xFF2D3436),
                          size: 16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          locationData.address,
                          style: const TextStyle(
                            color: Color(0xFF2D3436),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Icon(
                          Icons.phone_iphone,
                          color: Color(0xFF2D3436),
                          size: 16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          locationData.contactNumber,
                          style: const TextStyle(
                            color: Color(0xFF2D3436),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Expanded(
                        child: Text(
                          "Slide to expand",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Color(0xFF2D3436),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Icon(
                          Icons.swipe_left,
                          color: Color(0xFF2D3436),
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
