import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/api/api.dart';
import 'package:shimmer/shimmer.dart';

class DistrictSelectPage extends StatelessWidget {
  DistrictSelectPage({required this.userDistrict, super.key});

  UserDistrict userDistrict;

  Future<List<UserDistrict>> fetchUserDistricts() async {
    String endpoint = getEndpoint();

    endpoint += 'api/districts';

    log(endpoint);

    final response = await http.get(Uri.parse(endpoint));


    List<UserDistrict> districts = [];

    var body = json.decode(response.body);
    var dataMap = body['data'];


    for (var data in dataMap) {

      var attributes = data['attributes'];

      UserDistrict article = UserDistrict.fromMap(attributes);

      article.id = data['id'] ?? -1;

      districts.add(article);
    }

    return districts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select District'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, userDistrict);
          return false;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding:  const EdgeInsets.all(16),
          child: FutureBuilder<List<UserDistrict>>(
            future: fetchUserDistricts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<UserDistrict>? data = snapshot.data;
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    var district = data[index];
                    return Card(
                      child: ListTile(
                        title: Text(district.title),
                        onTap: () {
                          
                          userDistrict = district;
      
                          Navigator.pop(context, userDistrict);
                        },
                      ),
                    );
                  },
                );
              } else {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
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
                          height: 64,
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
