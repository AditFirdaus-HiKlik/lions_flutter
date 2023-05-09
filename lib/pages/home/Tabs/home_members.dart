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
import 'package:lions_flutter/api/models/article.dart';
import 'package:lions_flutter/api/network.dart';
import 'package:lions_flutter/api/rest_api.dart';
import 'package:lions_flutter/models/lions_member/lions_member.dart';
import 'package:lions_flutter/pages/Auth/login_page.dart';
import 'package:lions_flutter/pages/members_page.dart';
import 'package:shimmer/shimmer.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:http/http.dart' as http;

class HomeMembers extends StatefulWidget {
  const HomeMembers({super.key});

  static void toMembersPage(BuildContext context, LionsMember memberData) {
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
  late LionsCollection _collection;

  Future<List<LionsMember>> _fetchData() async {
    Map<String, String> parameters = {
      'populate': '*',
      'populate[0]': 'avatar',
      'populate[1]': 'phone',
      'populate[2]': 'district',
      'populate[3]': 'club',
      'populate[4]': 'awards',
      'populate[5]': 'achivements',
      'populate[6]': 'social',
      'populate[7]': 'trainings',
    };

    dynamic data = await _collection.fetch(parameters: parameters);

    List<LionsMember> members = [];

    for (dynamic item in data) {
      var member = _processItem(item);
      members.add(member);
    }

    return members;
  }

  LionsMember _processItem(item) {
    var member = LionsMember.fromJson(item);

    return member;
  }

  @override
  void initState() {
    super.initState();

    _collection = LionsCollection();
    _collection.path = '/users';
  }

  @override
  Widget build(BuildContext context) {
    // Collumn with search
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: 'Search',
            onSubmitted: (value) {
              print(value);
            },
          ),
          // Filter button on the right
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.filter_alt),
                label: const Text('Filter'),
                onPressed: () {},
              ),
            ],
          ),
          // Members list
          FutureBuilder<List<LionsMember>>(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AnimationLimiter(
                  child: MasonryGridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 250),
                        child: SlideAnimation(
                          verticalOffset: 100.0,
                          child: FadeInAnimation(
                            child: _buildMemberCard(snapshot.data![index]),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return _viewLoading();
            },
          ),
        ],
      ),
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

  Widget _buildMemberCard(LionsMember memberData) {
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

  static Future<List<LionsMember>> fetchMembers(
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

    List<LionsMember> members = [];

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
        members.add(LionsMember.fromJson(data));
      }
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(code: 0, message: "Something went wrong");
    }

    return members;
  }
}
