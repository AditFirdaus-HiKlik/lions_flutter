import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/models/lions_rank/lions_rank.dart';

class RankSelectPage extends StatefulWidget {
  RankSelectPage({Key? key, this.selectedRank}) : super(key: key);

  LionsRank? selectedRank;

  @override
  State<RankSelectPage> createState() => _RankSelectPageState();
}

class _RankSelectPageState extends State<RankSelectPage> {
  Future<List<LionsRank>> fetchRanks() async {
    var result =
        await http.get(Uri.parse("https://lions.up.railway.app/api/ranks"));

    List<LionsRank> data = [];

    var body = jsonDecode(result.body);

    for (dynamic item in body['data']) {
      var news = processItem(item);
      data.add(news);
    }

    return data;
  }

  LionsRank processItem(item) {
    item.addAll(item['attributes']);
    item.remove('attributes');

    var rank = LionsRank.fromJson(item);

    return rank;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.selectedRank);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Rank"),
        ),
        body: FutureBuilder<List<LionsRank>>(
          future: fetchRanks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var rank = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        title: Text(rank.title),
                        onTap: () {
                          widget.selectedRank = rank;
                          Navigator.pop(context, widget.selectedRank);
                        },
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
