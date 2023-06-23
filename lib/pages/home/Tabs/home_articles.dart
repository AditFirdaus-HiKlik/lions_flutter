import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/models/article_data/article_data.dart';
import 'package:lions_flutter/services/content_service/content_service.dart';
import 'package:lions_flutter/pages/news_view_page.dart';
import 'package:lions_flutter/widgets/article_card.dart';

import 'package:shimmer/shimmer.dart';

class HomeArticles extends StatefulWidget {
  const HomeArticles({super.key});

  void toNewsPage(BuildContext context, ArticleData articleData) {
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => NewsViewPage(articleData)));
  }

  @override
  State<HomeArticles> createState() => _HomeArticlesState();
}

class _HomeArticlesState extends State<HomeArticles> {
  Future<List<ArticleData>> _fetchData() async {
    Map<String, String> parameters = {'populate': '*', 'sort': 'id:desc'};

    var result = await ContentService.fetchCollection(
      'articles',
      parameters: parameters,
    );

    return _processData(result['data']);
  }

  List<ArticleData> _processData(data) {
    List<ArticleData> processedData = [];

    for (dynamic item in data) {
      var article = _processItem(item);
      processedData.add(article);
    }

    return processedData;
  }

  ArticleData _processItem(item) {
    item.addAll(item['attributes']);
    item.remove('attributes');

    item['coverImage'].addAll(item['coverImage']['data']);
    item['coverImage'].remove('data');

    item['coverImage'].addAll(item['coverImage']['attributes']);
    item['coverImage'].remove('attributes');

    var article = ArticleData.fromJson(item);

    return article;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_buildHeader(), renderContents()]),
    );
  }

  Widget renderContents() {
    return FutureBuilder<List<ArticleData>>(
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

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Articles',
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
          return buildCardLoading(index);
        },
      ),
    );
  }

  Widget buildCard(ArticleData articleData, int index) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: index,
        child: ScaleAnimation(
          scale: 1.25,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
          child: FadeInAnimation(
            child: ArticleCard(
              articleData,
              onTap: () => widget.toNewsPage(context, articleData),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardLoading(int index) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: index,
        child: const FlipAnimation(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
          child: FadeInAnimation(
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            ),
          ),
        ),
      ),
    );
  }
}
