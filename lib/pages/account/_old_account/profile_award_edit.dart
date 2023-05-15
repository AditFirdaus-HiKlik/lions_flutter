// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:lions_flutter/Classes/user/user_data.dart';

// class ProfileAwardEdit extends StatefulWidget {
//   ProfileAwardEdit({Key? key, required this.userAwards}) : super(key: key);

//   List<UserAward> userAwards = [];

//   @override
//   _ProfileAwardEditState createState() => _ProfileAwardEditState();
// }

// class _ProfileAwardEditState extends State<ProfileAwardEdit> {
//   Future _addUserAward() async {
//     var result = await _showAwardDialog();

//     if (result != null) {
//       setState(() {
//         widget.userAwards.add(result);
//       });
//     }
//   }

//   Future _updateUserAward(UserAward userAward) async {
//     var result = await _showAwardDialog(userAward: userAward);

//     if (result != null) {
//       setState(() {
//         widget.userAwards[
//             widget.userAwards.indexWhere((u) => u.id == userAward.id)] = result;
//       });
//     }
//   }

//   Future _deleteUserAward(UserAward userAward) async {
//     setState(() {
//       widget.userAwards.remove(userAward);
//     });
//   }

//   Future<UserAward?> _showAwardDialog({UserAward? userAward}) async {
//     bool addNew = userAward == null;

//     userAward = addNew ? UserAward() : userAward;

//     return showCupertinoDialog<UserAward>(
//       context: context,
//       builder: (BuildContext context) {
//         final formKey = GlobalKey<FormState>();

//         userAward!;

//         String title = userAward.title;
//         String body = userAward.body;

//         return AlertDialog(
//           title: Text(addNew ? "Add User Award" : "Edit User Award"),
//           content: Form(
//             key: formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 TextFormField(
//                   initialValue: title,
//                   decoration: const InputDecoration(labelText: "Title"),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter a title";
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     title = value!;
//                   },
//                 ),
//                 TextFormField(
//                   initialValue: body,
//                   decoration: const InputDecoration(labelText: "Body"),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter a body";
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     body = value!;
//                   },
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop(null);
//               },
//             ),
//             TextButton(
//               child: Text(addNew ? "Add" : "Save"),
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   formKey.currentState!.save();
//                   userAward!.title = title;
//                   userAward.body = body;
//                   Navigator.of(context).pop(userAward);
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User Awards"),
//       ),
//       body: WillPopScope(
//         onWillPop: () async {
//           Navigator.pop(context, widget.userAwards);
//           return Future.value(false);
//         },
//         child: ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: widget.userAwards.length,
//           itemBuilder: (context, index) {
//             UserAward userAward = widget.userAwards[index];
//             return AnimationLimiter(
//               child: AnimationConfiguration.staggeredList(
//                 position: 0,
//                 delay: const Duration(milliseconds: 500),
//                 child: ScaleAnimation(
//                   scale: 1.5,
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.easeOutExpo,
//                   child: FadeInAnimation(
//                     child: Container(
//                       margin: const EdgeInsets.only(bottom: 16),
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 10,
//                             spreadRadius: 5,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         title: Text(userAward.title),
//                         subtitle: Text(userAward.body),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             IconButton(
//                               icon: const Icon(Icons.edit),
//                               onPressed: () {
//                                 _updateUserAward(userAward);
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete),
//                               onPressed: () {
//                                 _deleteUserAward(userAward);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           _addUserAward();
//         },
//       ),
//     );
//   }
// }
