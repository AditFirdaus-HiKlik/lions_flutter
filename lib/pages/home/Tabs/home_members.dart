import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lions_flutter/services/content_service/content_service.dart';
import 'package:lions_flutter/models/lions_member/lions_member.dart';
import 'package:lions_flutter/pages/members_page.dart';
import 'package:shimmer/shimmer.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeMembers extends StatefulWidget {
  const HomeMembers({super.key});

  @override
  State<HomeMembers> createState() => _HomeMembersState();
}

class _HomeMembersState extends State<HomeMembers> {
  String searchQuery = '';

  void toMembersPage(LionsMember member) {
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => MemberPage(member: member)));
  }

  Future<List<LionsMember>> _fetchData() async {
    var parameters = {
      'populate': '*',
      'populate[0]': 'avatar',
      'populate[1]': 'phone',
      'populate[2]': 'district',
      'populate[3]': 'club',
      'populate[4]': 'awards',
      'populate[5]': 'achivements',
      'populate[6]': 'social',
      'populate[7]': 'trainings',
      'populate[8]': 'position'
    };

    if (searchQuery.isNotEmpty) {
      parameters['filters[name][\$contains]'] = 'position';
    }

    var result = await ContentService.fetchCollection(
      'users',
      parameters: parameters,
    );

    return _processData(result);
  }

  List<LionsMember> _processData(data) {
    List<LionsMember> processedData = [];

    for (dynamic item in data) {
      var article = _processItem(item);
      processedData.add(article);
    }

    return processedData;
  }

  LionsMember _processItem(item) {
    var member = LionsMember.fromJson(item);

    return member;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: 'Search',
            padding: const EdgeInsets.all(8.0),
            onChanged: (value) async {
              searchQuery = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 8.0),
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

  Widget _buildMemberCard(LionsMember member) {
    Widget avatarWidget = Center(
      child: SizedBox(
        width: 64,
        height: 64,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            member.avatar.url,
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
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'assets/icon-sports.png',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );

    return ZoomTapAnimation(
        onTap: () => toMembersPage(member),
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
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
                member.name,
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
                member.username,
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
