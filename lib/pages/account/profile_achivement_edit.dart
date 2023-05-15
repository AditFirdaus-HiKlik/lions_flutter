import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/models/member_achivement/member_achivement.dart';
// import 'package:lions_flutter/Classes/user/user_data.dart';

class AchivementTemp {
  int id;
  String title;
  String description;

  AchivementTemp({
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

class ProfileAchivementEdit extends StatefulWidget {
  ProfileAchivementEdit({Key? key, required this.userAchivements})
      : super(key: key);
  List<MemberAchivement> userAchivements;
  @override
  _ProfileAchivementEditState createState() => _ProfileAchivementEditState();
}

class _ProfileAchivementEditState extends State<ProfileAchivementEdit> {
  // Account account = Account.accounts[0];
  List<AchivementTemp> achivements = [];

  @override
  void initState() {
    achivements = widget.userAchivements
        .map((e) => AchivementTemp(
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
        // account.achivements.add(result);
        // widget.userAchivements.add(result!);
        achivements.add(result);
      });
    }
  }

  Future _updateUserAchivement(AchivementTemp userAchivement) async {
    var result = await _showAchivementDialog(userAchivement: userAchivement);

    if (result != null) {
      setState(() {
        achivements[widget.userAchivements
            .indexWhere((u) => u.id == userAchivement.id)] = result;
      });
    }
  }

  Future _deleteUserAchivement(AchivementTemp userAchivement) async {
    setState(() {
      achivements.remove(userAchivement);
    });
  }

  Future<AchivementTemp?> _showAchivementDialog(
      {AchivementTemp? userAchivement}) async {
    bool addNew = userAchivement == null;

    userAchivement = addNew ? AchivementTemp() : userAchivement;

    return showCupertinoDialog<AchivementTemp>(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();

        userAchivement!;

        String title = userAchivement.title;
        String description = userAchivement.description;

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
                  userAchivement?.setTitle(title);
                  userAchivement?.setDescription(description);
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
          padding: const EdgeInsets.all(16),
          itemCount: achivements.length,
          itemBuilder: (context, index) {
            AchivementTemp userAchivement = achivements[index];
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
