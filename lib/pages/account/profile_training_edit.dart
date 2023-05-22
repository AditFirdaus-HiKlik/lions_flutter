import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/models/member_training/member_training.dart';
// import 'package:lions_flutter/Classes/user/user_data.dart';

class ProfileTrainingEdit extends StatefulWidget {
  ProfileTrainingEdit({Key? key, required this.trainings}) : super(key: key);

  List<MemberTraining> trainings = [];

  @override
  _ProfileTrainingEditState createState() => _ProfileTrainingEditState();
}

class _ProfileTrainingEditState extends State<ProfileTrainingEdit> {
  @override
  void initState() {
    widget.trainings = widget.trainings
        .map((e) => MemberTraining(
              id: e.id,
              title: e.title,
              description: e.description,
            ))
        .toList();
    super.initState();
  }

  Future _addMemberTraining() async {
    var result = await _showTrainingDialog();

    if (result != null) {
      setState(() {
        // widget.userTrainings.add(result);
        widget.trainings.add(result);
      });
    }
  }

  Future _updateMemberTraining(MemberTraining award) async {
    var result = await _showTrainingDialog(userTraining: award);

    if (result != null) {
      setState(() {
        widget.trainings[widget.trainings.indexWhere((u) => u.id == award.id)] =
            result;
      });
    }
  }

  Future _deleteMemberTraining(MemberTraining userTraining) async {
    setState(() {
      widget.trainings.remove(userTraining);
    });
  }

  Future<MemberTraining?> _showTrainingDialog(
      {MemberTraining? userTraining}) async {
    bool addNew = userTraining == null;

    userTraining = addNew ? MemberTraining() : userTraining;

    return showCupertinoDialog<MemberTraining>(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();

        userTraining!;

        String title = userTraining!.title;
        String description = userTraining!.description;

        return AlertDialog(
          title: Text(addNew ? "Add User Training" : "Edit User Training"),
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
                  decoration: const InputDecoration(labelText: "Body"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a body";
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

                  userTraining = userTraining?.copyWith(
                    title: title,
                    description: description,
                  );

                  Navigator.of(context).pop(userTraining);
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
        title: const Text("Trainings"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, widget.trainings);
          return Future.value(false);
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: widget.trainings.length,
          itemBuilder: (context, index) {
            MemberTraining userTraining = widget.trainings[index];
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
                        title: Text(userTraining.title),
                        subtitle: Text(userTraining.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _updateMemberTraining(userTraining);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deleteMemberTraining(userTraining);
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
          _addMemberTraining();
        },
      ),
    );
  }
}
