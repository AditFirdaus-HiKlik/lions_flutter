import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/Data/AppException.dart';
import 'package:lions_flutter/Data/ArticleData.dart';
import 'package:lions_flutter/Pages/news_view_page.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/api/network.dart';
import 'package:lions_flutter/api/rest_api.dart';

import 'package:lions_flutter/sports_widget.dart';
import 'package:shimmer/shimmer.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({super.key});

  @override
  State<HomeNews> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  List<ArticleData> _data = [];
  int _currentPage = 1;
  ScrollController _controller = ScrollController();

  Future _fetchData() async {
    String endpoint = getEndpoint();
    endpoint += 'api/articles';
    endpoint += '?';

    endpoint += "populate=*&";
    endpoint += "pagination[page]=$_currentPage&";
    endpoint += "sort=id:desc&";

    if (!(await isConnectedToInternet())) {
      throw AppException(code: 1, message: "No Internet Connection");
    }

    final response = await RestAPI.get(Uri.parse(endpoint));

    List<ArticleData> newData = [];

    var body = json.decode(response.body);
    var dataMap = body['data'];

    for (var data in dataMap) {
      ArticleData article = ArticleData.fromMap(data);

      newData.add(article);
    }

    setState(() {
      _data.addAll(newData);
    });
    try {} on AppException {
      rethrow;
    } catch (e) {
      throw AppException(code: 0, message: "Unknown Error: $e");
    }
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
                  ArticleData article = _data[index];
                  return AnimationLimiter(
                    child: AnimationConfiguration.staggeredList(
                      position: index,
                      child: ScaleAnimation(
                        scale: 1.25,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOutExpo,
                        child: FadeInAnimation(
                          child: _buildNewsCard(article),
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
            'News',
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

  Widget _buildNewsCard(ArticleData articleDatas) {
    String articleTitle = articleDatas.attributes.title;
    SingleImage articleCover = articleDatas.attributes.coverImage;

    return ZoomTapAnimation(
      end: 1.05,
      beginDuration: const Duration(milliseconds: 100),
      onTap: () {
        // Using bottom sheet to show the news
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => NewsViewPage(
              articleDatas,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        height: 256,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: articleCover.url,
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
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              height: 64,
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      articleTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.titleMedium!.fontSize,
                      ),
                    ),
                    Text(
                      articleDatas.attributes.author,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.labelMedium!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
