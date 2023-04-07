import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/Data/AppException.dart';
import 'package:lions_flutter/UserManager.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/api/network.dart';
import 'package:lions_flutter/api/rest_api.dart';
import 'package:lions_flutter/pages/Auth/login_page.dart';
import 'package:lions_flutter/pages/members_page.dart';
import 'package:shimmer/shimmer.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:http/http.dart' as http;

class HomeMembers extends StatefulWidget {
  const HomeMembers({super.key});

  static void toMembersPage(BuildContext context, UserData memberData) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => MemberPage(memberData: memberData)));
  }

  @override
  State<HomeMembers> createState() => _HomeMembersState();
}

class _HomeMembersState extends State<HomeMembers> {
  List<UserData> _data = [];
  int _currentPage = 1;
  int _pageSize = 10;
  ScrollController _controller = ScrollController();

  final TextEditingController _searchController = TextEditingController();

  bool mustLogin = true;

  Future<List<UserData>> _fetchData() async {
    var start = (_currentPage - 1) * _pageSize;
    var limit = _pageSize;

    String endpoint = getEndpoint();
    endpoint += "api/users";
    endpoint += '?';

    endpoint += "start=$start&";
    endpoint += "limit=$limit&";
    endpoint += "sort=id:desc&";
    endpoint += "populate=avatar&";
    endpoint += "populate=awards&";
    endpoint += "populate=achivements&";
    endpoint += '_q=${_searchController.text}&';

    log(endpoint);

    // var header = {'Authorization': "Bearer ${UserManager.jwtToken}"};

    // if (!(await isConnectedToInternet())) {
    //   return throw AppException(code: 1, message: "No Internet Connection");
    // }

    // if (!UserManager.isLoggedIn && mustLogin) {
    //   return throw AppException(code: 2, message: "Not Signed In");
    // }

    final response = await http.get(Uri.parse(endpoint));

    List<UserData> newData = [];

    var datas = json.decode(response.body);

    for (var data in datas) {
      newData.add(UserData.fromMap(data));
    }

    setState(() {
      _data.addAll(newData);
    });

    try {} on AppException {
      rethrow;
    } catch (e) {
      throw AppException(code: 0, message: "Something went wrong");
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
    if (!UserManager.isLoggedIn && mustLogin) {
      return Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ZoomTapAnimation(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );

              _fetchData();

              setState(() {});
            },
            child: Column(
              children: const [
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Login to view this page",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Click here to login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      controller: _controller,
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(
              height: 16,
            ),
            CupertinoSearchTextField(
              backgroundColor: Colors.white,
              controller: _searchController,
              onChanged: (value) async {
                setState(() {});
                _data.clear();
                _currentPage = 1;
                await _fetchData();
                setState(() {});
              },
            ),
            const Divider(
              thickness: 1,
              height: 64,
            ),
            if (_data.isNotEmpty)
              MasonryGridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: _data.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return AnimationLimiter(
                    child: AnimationConfiguration.staggeredList(
                      position: index,
                      child: ScaleAnimation(
                        scale: 1.5,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOutExpo,
                        child: FadeInAnimation(
                          child: _buildMemberCard(_data[index]),
                        ),
                      ),
                    ),
                  );
                },
              )
            else
              _viewLoading(),
          ]),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Members',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _viewLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: MasonryGridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 250),
            child: SlideAnimation(
              verticalOffset: 100.0,
              child: FadeInAnimation(
                child: Container(
                  margin: const EdgeInsets.all(8),
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
          );
        },
      ),
    );
  }

  Widget _buildMemberCard(UserData memberData) {
    Widget avatarWidget = Center(
      child: SizedBox(
        width: 64,
        height: 64,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            memberData.avatar.url,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress != null) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 128,
                    height: 128,
                    color: Colors.white,
                  ),
                );
              }

              return child;
            },
          ),
        ),
      ),
    );

    return ZoomTapAnimation(
        onTap: () => HomeMembers.toMembersPage(context, memberData),
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: avatarWidget,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                memberData.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                memberData.username,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}

class MemberAPI {
  static RestPagination articlePagination = RestPagination("member");
  static const String urlMembers = 'api/users';

  static const bool mustLogin = false;

  static Future<List<UserData>> fetchMembers(
      {List<String> categories = const [],
      int page = 0,
      String query = ""}) async {
    page = articlePagination.page;

    String endpoint = getEndpoint();
    endpoint += urlMembers;
    endpoint += '?';

    endpoint += "populate=avatar&";
    endpoint += "populate=sports&";
    endpoint += "populate=jobs&";
    endpoint += "populate=achivements&";
    endpoint += "populate=gallery.image&";
    endpoint += "sort=id:desc&";
    endpoint += "pagination[page]=$page&";
    endpoint += '_q=$query&';

    for (var category in categories) {
      endpoint += 'filters[\$or][0][sports][name][\$eq]=$category&';
    }

    List<UserData> members = [];

    if (!(await isConnectedToInternet())) {
      return throw AppException(code: 1, message: "No Internet Connection");
    }

    if (!UserManager.isLoggedIn && mustLogin) {
      return throw AppException(code: 2, message: "Not Signed In");
    }

    try {
      final response = await RestAPI.get(Uri.parse(endpoint));

      var datas = json.decode(response.body);

      for (var data in datas) {
        members.add(UserData.fromMap(data));
      }
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(code: 0, message: "Something went wrong");
    }

    return members;
  }
}
