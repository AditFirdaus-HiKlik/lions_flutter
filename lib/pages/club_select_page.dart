import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/models/lions_club/lions_club.dart';

class ClubSelectPage extends StatefulWidget {
  ClubSelectPage({Key? key, this.selectedClub}) : super(key: key);

  LionsClub? selectedClub;

  @override
  State<ClubSelectPage> createState() => _ClubSelectPageState();
}

class _ClubSelectPageState extends State<ClubSelectPage> {
  Future<List<LionsClub>> fetchClubs() async {
    var result =
        await http.get(Uri.parse("https://lions.up.railway.app/api/clubs"));

    List<LionsClub> data = [];

    var body = jsonDecode(result.body);

    for (dynamic item in body['data']) {
      var news = processItem(item);
      data.add(news);
    }

    return data;
  }

  LionsClub processItem(item) {
    item.addAll(item['attributes']);
    item.remove('attributes');

    var club = LionsClub.fromJson(item);

    return club;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.selectedClub);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Club"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<LionsClub>>(
            future: fetchClubs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var club = snapshot.data![index];
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: ListTile(
                        title: Text(club.title),
                        onTap: () {
                          widget.selectedClub = club;
                          Navigator.pop(context, widget.selectedClub);
                        },
                      ),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
