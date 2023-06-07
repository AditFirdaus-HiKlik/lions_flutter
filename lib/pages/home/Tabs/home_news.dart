import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/api/models/lions_collection.dart';
import 'package:lions_flutter/models/article_data/article_data.dart';
import 'package:lions_flutter/pages/news_view_page.dart';
import 'package:lions_flutter/widgets/article_card.dart';

import 'package:shimmer/shimmer.dart';

class HomeArticles extends StatefulWidget {
  const HomeArticles({super.key});

  void toNewsPage(BuildContext context, ArticleData articleData) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => NewsViewPage(articleData)));
  }

  @override
  State<HomeArticles> createState() => _HomeArticlesState();
}

class _HomeArticlesState extends State<HomeArticles> {
  late LionsCollection _collection;

  Future<List<ArticleData>> _fetchData() async {
    Map<String, String> parameters = {'populate': '*'};

    dynamic data = await _collection.fetch(parameters: parameters);

    List<ArticleData> articles = [];

    for (dynamic item in data['data']) {
      var article = _processItem(item);
      articles.add(article);
    }

    return articles;
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
  void initState() {
    super.initState();

    _collection = LionsCollection();
    _collection.path = '/articles';
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
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
