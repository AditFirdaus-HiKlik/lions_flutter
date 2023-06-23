import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/models/lions_position/lions_position.dart';

class PositionSelectPage extends StatefulWidget {
  PositionSelectPage({Key? key, this.selectedPosition}) : super(key: key);

  LionsPosition? selectedPosition;

  @override
  State<PositionSelectPage> createState() => _PositionSelectPageState();
}

class _PositionSelectPageState extends State<PositionSelectPage> {
  Future<List<LionsPosition>> fetchPositions() async {
    var result =
        await http.get(Uri.parse("https://lions.up.railway.app/api/positions"));

    List<LionsPosition> data = [];

    var body = jsonDecode(result.body);

    for (dynamic item in body['data']) {
      var news = processItem(item);
      data.add(news);
    }

    return data;
  }

  LionsPosition processItem(item) {
    item.addAll(item['attributes']);
    item.remove('attributes');

    var position = LionsPosition.fromJson(item);

    return position;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.selectedPosition);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Position"),
        ),
        body: FutureBuilder<List<LionsPosition>>(
          future: fetchPositions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var position = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        title: Text(position.title),
                        onTap: () {
                          widget.selectedPosition = position;
                          Navigator.pop(context, widget.selectedPosition);
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
