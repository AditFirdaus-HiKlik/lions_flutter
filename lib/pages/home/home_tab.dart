// ignore_for_file: must_be_immutable, library_private_types_in_public_api


import 'package:flutter/material.dart';

class HomeTab<T> extends StatefulWidget {
  HomeTab({
    Key? key,
    required this.fetchData,
    required this.onList,
    required this.onError,
    required this.onEmpty,
    required this.onLoading,
    this.title,
    this.icon,
    this.usePagination = false,
    this.useRefresh = false,
    this.homePagination,
  }) : super(key: key);

  Future<List<T>>? Function() fetchData;
  HomePagination<T>? homePagination;
  IconData? icon;
  Widget Function() onEmpty;
  Widget Function(Exception) onError;
  Widget Function(List<dynamic>) onList;
  Widget Function() onLoading;
  String? title;
  bool usePagination = false;
  bool useRefresh = false;

  @override
  _HomeTabState<T> createState() => _HomeTabState<T>();
}

class _HomeTabState<T> extends State<HomeTab> {
  void _refresh() {
    setState(() {});
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (widget.icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(widget.icon),
                ),
              if (widget.title != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(widget.title!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
            ],
          ),
          if (widget.useRefresh)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
            ),
        ],
      ),
    );
  }

  Widget _buildView() {
    return FutureBuilder(
      future: widget.fetchData() as Future<List<T>>,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return widget.onError(snapshot.error as Exception);
        } else if (snapshot.hasData && (snapshot.data as List<T>).isEmpty) {
          return widget.onEmpty();
        } else if (snapshot.hasData) {
          return widget.onList(snapshot.data as List<T>);
        } else {
          return widget.onLoading();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        _buildHeader(),
        const Divider(
          thickness: 1,
        ),
        _buildView(),
      ],
    );
  }
}

class HomePagination<T> {
  HomePagination({
    this.page = 0,
    this.pageSize = 10,
    this.pageCount = 0,
    this.total = 0,
    this.data = const [],
  });

  List<T> data = [];
  int page = 0;
  int pageCount = 0;
  int pageSize = 10;
  int total = 0;
}
