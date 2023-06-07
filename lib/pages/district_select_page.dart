import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/models/lions_district/lions_district.dart';

class DistrictSelectPage extends StatefulWidget {
  DistrictSelectPage({Key? key, this.selectedDistrict}) : super(key: key);

  LionsDistrict? selectedDistrict;

  @override
  State<DistrictSelectPage> createState() => _DistrictSelectPageState();
}

class _DistrictSelectPageState extends State<DistrictSelectPage> {
  Future<List<LionsDistrict>> fetchDistricts() async {
    var result =
        await http.get(Uri.parse("https://lions.up.railway.app/api/districts"));

    List<LionsDistrict> data = [];

    var body = jsonDecode(result.body);

    for (dynamic item in body['data']) {
      var news = processItem(item);
      data.add(news);
    }

    return data;
  }

  LionsDistrict processItem(item) {
    item.addAll(item['attributes']);
    item.remove('attributes');

    var district = LionsDistrict.fromJson(item);

    return district;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.selectedDistrict);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select District"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<LionsDistrict>>(
            future: fetchDistricts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var district = snapshot.data![index];
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: ListTile(
                        title: Text(district.title),
                        onTap: () {
                          widget.selectedDistrict = district;
                          Navigator.pop(context, widget.selectedDistrict);
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
