import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/models/member_award/member_award.dart';
// import 'package:lions_flutter/Classes/user/user_data.dart';

class AwardTemp {
  int id;
  String title;
  String description;

  AwardTemp({
    this.id = 6,
    this.title = '',
    this.description = '',
  });

  void setTitle(String title) {
    this.title = title;
  }

  void setDescription(String description) {
    this.description = description;
  }
}

class ProfileAwardEdit extends StatefulWidget {
  ProfileAwardEdit({Key? key, required this.userAwards}) : super(key: key);

  List<MemberAward> userAwards = [];

  @override
  _ProfileAwardEditState createState() => _ProfileAwardEditState();
}

class _ProfileAwardEditState extends State<ProfileAwardEdit> {
  List<AwardTemp> awards = [];

  @override
  void initState() {
    awards = widget.userAwards
        .map((e) => AwardTemp(
              id: e.id,
              title: e.title,
              description: e.description,
            ))
        .toList();
    super.initState();
  }

  Future _addMemberAward() async {
    var result = await _showAwardDialog();

    if (result != null) {
      setState(() {
        // widget.userAwards.add(result);
        awards.add(result);
      });
    }
  }

  Future _updateMemberAward(AwardTemp award) async {
    var result = await _showAwardDialog(userAward: award);

    if (result != null) {
      setState(() {
        awards[widget.userAwards.indexWhere((u) => u.id == award.id)] = result;
      });
    }
  }

  Future _deleteMemberAward(AwardTemp userAward) async {
    setState(() {
      awards.remove(userAward);
    });
  }

  Future<AwardTemp?> _showAwardDialog({AwardTemp? userAward}) async {
    bool addNew = userAward == null;

    userAward = addNew ? AwardTemp() : userAward;

    return showCupertinoDialog<AwardTemp>(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();

        userAward!;

        String title = userAward.title;
        String body = userAward.description;

        return AlertDialog(
          title: Text(addNew ? "Add User Award" : "Edit User Award"),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  initialValue: title,
                  decoration: const InputDecoration(labelText: "Title"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    title = value!;
                  },
                ),
                TextFormField(
                  initialValue: body,
                  decoration: const InputDecoration(labelText: "Body"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a body";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    body = value!;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            TextButton(
              child: Text(addNew ? "Add" : "Save"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  userAward?.setTitle(title);
                  userAward?.setDescription(body);
                  // MemberAward!.title = title;
                  // MemberAward.body = body;
                  Navigator.of(context).pop(userAward);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awards"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, awards);
          return Future.value(false);
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: awards.length,
          itemBuilder: (context, index) {
            AwardTemp userAward = awards[index];
            return AnimationLimiter(
              child: AnimationConfiguration.staggeredList(
                position: 0,
                delay: const Duration(milliseconds: 500),
                child: ScaleAnimation(
                  scale: 1.5,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutExpo,
                  child: FadeInAnimation(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(userAward.title),
                        subtitle: Text(userAward.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _updateMemberAward(userAward);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deleteMemberAward(userAward);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _addMemberAward();
        },
      ),
    );
  }
}
