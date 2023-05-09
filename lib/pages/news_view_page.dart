import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lions_flutter/app/app_config.dart';
import 'package:lions_flutter/models/article_data/article_data.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class NewsViewPage extends StatefulWidget {
  final ArticleData _articleData;

  const NewsViewPage(this._articleData, {super.key});

  @override
  State<NewsViewPage> createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {
  final ScrollController _scrollController = ScrollController();

  void toBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: toBack,
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              launchUrlString(widget._articleData.url,
                  mode: LaunchMode.externalApplication);
            },
            icon: const Icon(
              Icons.open_in_browser,
            ),
            label: const Text(
              'Open Article',
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget._articleData.title,
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 256,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget._articleData.coverImage.url,
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
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "By ${widget._articleData.author}",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              IgnorePointer(
                child: Markdown(
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  controller: null,
                  softLineBreak: true,
                  selectable: true,
                  data: widget._articleData.body,
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Text(
                widget._articleData.url,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                ),
              ),
            ]),
      ),
    );
  }
}
