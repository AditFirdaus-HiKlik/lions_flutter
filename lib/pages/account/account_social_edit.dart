import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/models/member_social/member_social.dart';
// import 'package:lions_flutter/Classes/user/user_data.dart';

class ProfileSocialEdit extends StatefulWidget {
  ProfileSocialEdit({Key? key, required this.userAchivements})
      : super(key: key);
  List<MemberSocial> userAchivements;
  @override
  _ProfileSocialEditState createState() => _ProfileSocialEditState();
}

class _ProfileSocialEditState extends State<ProfileSocialEdit> {
  @override
  void initState() {
    widget.userAchivements = widget.userAchivements
        .map((e) => MemberSocial(
              id: e.id,
              platform: e.platform,
              value: e.value,
            ))
        .toList();
    super.initState();
  }

  Future _addUserAchivement() async {
    var result = await _showSocialDialog();

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

  Future _updateUserAchivement(MemberSocial userAchivement) async {
    var result = await _showSocialDialog(userAchivement: userAchivement);

    if (result != null) {
      setState(() {
        widget.userAchivements[widget.userAchivements
            .indexWhere((u) => u.id == userAchivement.id)] = result;
      });
    }
  }

  Future _deleteUserAchivement(MemberSocial userAchivement) async {
    setState(() {
      widget.userAchivements.remove(userAchivement);
    });
  }

  Future<MemberSocial?> _showSocialDialog(
      {MemberSocial? userAchivement}) async {
    bool addNew = userAchivement == null;

    userAchivement = addNew ? const MemberSocial() : userAchivement;

    return showCupertinoDialog<MemberSocial>(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();

        userAchivement!;

        String platform = userAchivement!.platform;
        String value = userAchivement!.value;

        return AlertDialog(
          title: Text(addNew ? "Add User Achivement" : "Edit User Achivement"),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  initialValue: platform,
                  decoration: const InputDecoration(labelText: "Title"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    platform = value!;
                  },
                ),
                TextFormField(
                  initialValue: value,
                  decoration: const InputDecoration(labelText: "description"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    value = value!;
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
                    platform: platform,
                    value: value,
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
            MemberSocial userAchivement = widget.userAchivements[index];
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
                        title: Text(userAchivement.platform),
                        subtitle: Text(userAchivement.value),
                        trailing: Switch(
                          value: userAchivement.visible,
                          onChanged: (value) {
                            setState(() {
                              widget.userAchivements[index] =
                                  userAchivement.copyWith(visible: value);
                            });
                          },
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
