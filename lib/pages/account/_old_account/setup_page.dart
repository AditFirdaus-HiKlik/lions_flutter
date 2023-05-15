// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:lions_flutter/Classes/user/user_data.dart';
// import 'package:lions_flutter/UserManager.dart';

// import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// class SetupPage extends StatefulWidget {
//   const SetupPage({super.key});

//   @override
//   State<SetupPage> createState() => _SetupPageState();
// }

// class _SetupPageState extends State<SetupPage> {
//   bool _submitting = false;

//   UserData userData = UserData();
//   List<int> userSportData = [];
//   List<int> userJobData = [];

//   final TextEditingController fullnameController = TextEditingController();
//   final TextEditingController domicileController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController aboutController = TextEditingController();
//   DateTime birthDateController = DateTime.now();
//   final TextEditingController accountLineController = TextEditingController();
//   final TextEditingController accountInstagramController =
//       TextEditingController();

//   @override
//   void initState() {
//     load();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             clipBehavior: Clip.none,
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.all(32.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   _buildHeader(),
//                   const SizedBox(height: 32),
//                   _buildFullnameField(),
//                   const SizedBox(height: 16),
//                   _buildDomicileField(),
//                   const SizedBox(height: 16),
//                   _buildPhoneField(),
//                   const SizedBox(height: 16),
//                   _buildAboutField(),
//                   const SizedBox(height: 16),
//                   _buildBirthDateField(),
//                   const SizedBox(height: 16),
//                   _buildAccountLineField(),
//                   const SizedBox(height: 16),
//                   _buildAccountInstagramField(),
//                   const SizedBox(height: 16),
//                   _buildSelectSportField(),
//                   const SizedBox(height: 16),
//                   _buildSelectJobField(),
//                   const SizedBox(height: 16),
//                   _buildSaveButton(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ? Logic Section
//   Future save() async {
//     setState(() => _submitting = true);

//     try {
//       userData.name = fullnameController.text;
//       userData.address = domicileController.text;
//       userData.phone = phoneController.text;
//       userData.social.instagram = accountInstagramController.text;

//       UserManager.userData = userData;

//       await UserManager.saveUser();

//       Navigator.of(context).pop();
//     } catch (e) {
//       log(e.toString());
//     }

//     setState(() => _submitting = false);
//   }

//   Future load() async {
//     userData = UserManager.userData;

//     fullnameController.text = userData.name;
//     domicileController.text = userData.address;
//     phoneController.text = userData.phone;
//     accountInstagramController.text = userData.social.instagram;

//     setState(() => _submitting = false);
//   }

//   // ? Route Section

//   // ? UI Section
//   Widget _buildHeader() {
//     return Column(
//       children: const [
//         Text(
//           'Welcome to lions',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           'Please enter your details to continue',
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFullnameField() {
//     return TextFormField(
//       controller: fullnameController,
//       // IOS Style Text Input Decoration
//       decoration: const InputDecoration(
//         labelText: 'Fullname*',
//         hintText: 'Enter your fullname',
//         isDense: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//       ),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Please enter your fullname';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildDomicileField() {
//     return TextFormField(
//       controller: domicileController,
//       minLines: 1,
//       maxLines: 10,
//       decoration: const InputDecoration(
//         labelText: 'Domicile',
//         hintText: 'Enter your domicile',
//         isDense: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//       ),
//       validator: (value) {
//         return null;
//       },
//     );
//   }

//   Widget _buildPhoneField() {
//     return TextFormField(
//       controller: phoneController,
//       // IOS Style Text Input Decoration
//       decoration: const InputDecoration(
//         labelText: 'Phone*',
//         hintText: 'Enter your phone',
//         isDense: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//       ),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Please enter your phone';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildAboutField() {
//     // Enable Multiline
//     return TextFormField(
//       controller: aboutController,
//       minLines: 1,
//       maxLines: 10,
//       decoration: const InputDecoration(
//         labelText: 'About',
//         hintText: 'Enter your about',
//         isDense: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//       ),
//       validator: (value) {
//         return null;
//       },
//     );
//   }

//   Widget _buildBirthDateField() {
//     return ZoomTapAnimation(
//       onTap: () async {
//         final DateTime? date = await showCupertinoDialog<DateTime>(
//           context: context,
//           builder: (context) {
//             return DatePickerDialog(
//               initialDate: birthDateController,
//               firstDate: DateTime(1900),
//               lastDate: DateTime(2100),
//             );
//           },
//         );

//         if (date != null) {
//           setState(() {
//             birthDateController = date;
//           });
//         }
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           border: Border.all(color: Colors.grey),
//         ),
//         height: 50,
//         child: Row(
//           children: [
//             const SizedBox(width: 10),
//             const Expanded(
//               child: Text(
//                 "Birth Date",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Text(
//               DateFormat('dd MMMM yyyy').format(birthDateController),
//               style: const TextStyle(
//                 color: Colors.grey,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(width: 10),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAccountLineField() {
//     return TextFormField(
//       controller: accountLineController,
//       // IOS Style Text Input Decoration
//       decoration: const InputDecoration(
//         labelText: 'Account Line',
//         hintText: 'Enter your account line',
//         isDense: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//       ),
//       validator: (value) {
//         return null;
//       },
//     );
//   }

//   Widget _buildAccountInstagramField() {
//     return TextFormField(
//       controller: accountInstagramController,
//       // IOS Style Text Input Decoration
//       decoration: const InputDecoration(
//         labelText: 'Account Instagram',
//         hintText: 'Enter your account instagram',
//         isDense: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//       ),
//       validator: (value) {
//         return null;
//       },
//     );
//   }

//   Widget _buildSelectSportField() {
//     return FilledButton.icon(
//       onPressed: () {},
//       icon: const Icon(Icons.sports),
//       label: const Text("Select Sport"),
//       style: FilledButton.styleFrom(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         // Outlined Border Radius
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           side: const BorderSide(color: Colors.grey),
//         ),
//       ),
//     );
//   }

//   Widget _buildSelectJobField() {
//     return FilledButton.icon(
//       onPressed: () {},
//       icon: const Icon(Icons.work),
//       label: const Text("Select Jobs"),
//       style: FilledButton.styleFrom(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         // Outlined Border Radius
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           side: const BorderSide(color: Colors.grey),
//         ),
//       ),
//     );
//   }

//   Widget _buildSaveButton() {
//     return ElevatedButton.icon(
//         onPressed: _submitting ? null : save,
//         icon: const Icon(Icons.save),
//         label: Text(_submitting ? 'Saving...' : 'Save'),
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18.0),
//             ),
//           ),
//         ));
//   }

//   @override
//   void dispose() {
//     fullnameController.dispose();
//     domicileController.dispose();
//     phoneController.dispose();
//     aboutController.dispose();
//     accountLineController.dispose();
//     accountInstagramController.dispose();
//     super.dispose();
//   }
// }
