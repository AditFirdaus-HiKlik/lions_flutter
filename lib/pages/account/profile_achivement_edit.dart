import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/models/member_achivement/member_achivement.dart';
// import 'package:lions_flutter/Classes/user/user_data.dart';

class ProfileAchivementEdit extends StatefulWidget {
  ProfileAchivementEdit({Key? key, required this.userAchivements})
      : super(key: key);
  List<MemberAchivement> userAchivements;
  @override
  _ProfileAchivementEditState createState() => _ProfileAchivementEditState();
}

class _ProfileAchivementEditState extends State<ProfileAchivementEdit> {
  @override
  void initState() {
    widget.userAchivements = widget.userAchivements
        .map((e) => MemberAchivement(
              id: e.id,
              title: e.title,
              description: e.description,
            ))
        .toList();
    super.initState();
  }

  Future _addUserAchivement() async {
    var result = await _showAchivementDialog();

    if (result != null) {
      setState(() {
        // widget.userAchivements.add(result);
        log('$result');
        // account.widget.userAchivements.add(result);
        // widget.userAchivements.add(result!);
        widget.userAchivements.add(result);
      });
    }
  }

  Future _updateUserAchivement(MemberAchivement userAchivement) async {
    var result = await _showAchivementDialog(userAchivement: userAchivement);

    if (result != null) {
      setState(() {
        widget.userAchivements[widget.userAchivements
            .indexWhere((u) => u.id == userAchivement.id)] = result;
      });
    }
  }

  Future _deleteUserAchivement(MemberAchivement userAchivement) async {
    setState(() {
      widget.userAchivements.remove(userAchivement);
    });
  }

  Future<MemberAchivement?> _showAchivementDialog(
      {MemberAchivement? userAchivement}) async {
    bool addNew = userAchivement == null;

    userAchivement = addNew ? MemberAchivement() : userAchivement;

    return showCupertinoDialog<MemberAchivement>(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();

        userAchivement!;

        String title = userAchivement!.title;
        String description = userAchivement!.description;

        return AlertDialog(
          title: Text(addNew ? "Add User Achivement" : "Edit User Achivement"),
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
                  initialValue: description,
                  decoration: const InputDecoration(labelText: "description"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description = value!;
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

                  userAchivement = userAchivement?.copyWith(
                    title: title,
                    description: description,
                  );

                  Navigator.of(context).pop(userAchivement);
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
        title: const Text("Achivements"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, widget.userAchivements);
          return Future.value(false);
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: widget.userAchivements.length,
          itemBuilder: (context, index) {
            MemberAchivement userAchivement = widget.userAchivements[index];
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
                      padding: const EdgeInsets.all(8),
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
                        title: Text(userAchivement.title),
                        subtitle: Text(userAchivement.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _updateUserAchivement(userAchivement);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deleteUserAchivement(userAchivement);
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
          _addUserAchivement();
        },
      ),
    );
  }
}
