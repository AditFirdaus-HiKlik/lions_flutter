import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/Data/AppException.dart';
import 'package:lions_flutter/Data/LocationData.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/api/network.dart';
import 'package:lions_flutter/api/rest_api.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeLocations extends StatefulWidget {
  const HomeLocations({super.key});

  @override
  State<HomeLocations> createState() => _HomeLocationsState();
}

class _HomeLocationsState extends State<HomeLocations> {
  List<LocationData> _data = [];
  int _currentPage = 0;
  ScrollController _controller = ScrollController();

  Future<List<LocationData>> _fetchData() async {
    String endpoint = getEndpoint();
    endpoint += 'api/locations';
    endpoint += '?';

    endpoint += "populate=*&";
    endpoint += "pagination[page]=$_currentPage&";
    endpoint += "sort=id:desc&";

    if (!(await isConnectedToInternet())) {
      throw AppException(code: 1, message: "No Internet Connection");
    }

    try {
      final response = await RestAPI.get(Uri.parse(endpoint));

      List<LocationData> newData = [];

      var body = json.decode(response.body);
      var data = body['data'];

      for (var data in data) {
        newData.add(LocationData.fromJson(data));
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
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _currentPage++;
        _fetchData();
      }
    });
    _fetchData();
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
            if (_data.isNotEmpty)
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return AnimationLimiter(
                    child: AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        horizontalOffset: -100.0,
                        child: FadeInAnimation(
                          child: _buildLocationCard(_data[index]),
                        ),
                      ),
                    ),
                  );
                },
              )
            else
              _buildLoadingView(),
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

  Widget _buildLoadingView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        controller: _controller,
        primary: false,
        shrinkWrap: true,
        itemCount: 15,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimationLimiter(
            child: AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                horizontalOffset: -100.0,
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
                  launchUrlString(locationData.attributes.link,
                      mode: LaunchMode.externalApplication);
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.directions,
                label: 'Direction',
              ),
              SlidableAction(
                onPressed: (context) {
                  launchUrlString(
                      "tel:${locationData.attributes.contactNumber}");
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
                    locationData.attributes.title,
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
                          locationData.attributes.address,
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
                          locationData.attributes.contactNumber,
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

class LocationAPI {
  static RestPagination articlePagination = RestPagination("location");
  static const String urlEvents = 'api/locations';

  static Future<List<LocationData>> fetchLocations(
      {List<String> categories = const [], int page = 0}) async {
    page = articlePagination.page;

    String endpoint = getEndpoint();
    endpoint += urlEvents;
    endpoint += '?';

    endpoint += "populate=*&";
    endpoint += "pagination[page]=$page&";
    endpoint += "sort=id:desc&";

    for (var category in categories) {
      endpoint += 'filters[\$or][0][sports][name][\$eq]=$category&';
    }

    List<LocationData> locations = [];

    if (!(await isConnectedToInternet())) {
      return throw AppException(code: 1, message: "No Internet Connection");
    }

    try {
      final response = await RestAPI.get(Uri.parse(endpoint));

      var body = json.decode(response.body);
      var datas = body['data'];

      for (var data in datas) {
        locations.add(LocationData.fromJson(data));
      }
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(code: 0, message: "Unknown Error");
    }

    return locations;
  }
}
