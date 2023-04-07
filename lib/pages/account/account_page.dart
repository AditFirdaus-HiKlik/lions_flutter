import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/Pages/Account/account_edit_page.dart';
import 'package:lions_flutter/UserManager.dart';
import 'package:lions_flutter/pages/account/profile_achivement_edit.dart';
import 'package:lions_flutter/pages/account/profile_award_edit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  UserData get userData => UserManager.userData;
  set userData(UserData value) => UserManager.userData = value;

  @override
  void initState() {
    super.initState();
    LoadAccount();
  }

  // Load
  Future LoadAccount() async {
    await UserManager.loadUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
        ),
        leading: const BackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: editAccount,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimationConfiguration.staggeredList(
                  position: 0,
                  child: ScaleAnimation(
                    scale: 1.5,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    child: FadeInAnimation(
                      child: _renderProfile(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimationConfiguration.staggeredList(
                  position: 1,
                  delay: const Duration(milliseconds: 500),
                  child: ScaleAnimation(
                    scale: 1.5,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    child: FadeInAnimation(
                      child: _renderContacts(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimationConfiguration.staggeredList(
                  position: 2,
                  delay: const Duration(milliseconds: 500),
                  child: ScaleAnimation(
                    scale: 1.5,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    child: FadeInAnimation(
                      child: _renderAwards(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimationConfiguration.staggeredList(
                  position: 3,
                  delay: const Duration(milliseconds: 500),
                  child: ScaleAnimation(
                    scale: 1.5,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    child: FadeInAnimation(
                      child: _renderAchivements(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderProfile() {
    return Container(
      padding: const EdgeInsets.all(32),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (userData.districts.isNotEmpty)
                Shimmer.fromColors(
                  baseColor: Colors.orange,
                  highlightColor: Colors.yellow,
                  child: Text(
                    userData.districts[0].name,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (userData.clubs.isNotEmpty)
                Shimmer.fromColors(
                  baseColor: Colors.blue,
                  highlightColor: Colors.lightBlue[100]!,
                  child: Text(
                    userData.clubs[0].title,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
            height: 64,
          ),
          Center(
            child: SizedBox(
              width: 128,
              height: 128,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  userData.avatar.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress != null) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 128,
                          height: 128,
                          color: Colors.white,
                        ),
                      );
                    }

                    return child;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            userData.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            userData.username,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      userData.awards.length.toString(),
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Awards',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      userData.achivements.length.toString(),
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Achivements',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
            height: 48,
          ),
          Text(
            'About',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            userData.about,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContacts() {
    return Container(
      padding: const EdgeInsets.all(32),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Contacts',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.phone),
            title: Text(
              userData.phone,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              ),
            ),
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.email),
            title: Text(
              userData.email,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              ),
            ),
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.location_on),
            title: Text(
              userData.address,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderAwards() {
    return Container(
      padding: const EdgeInsets.all(32),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Awards',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Edit
              IconButton(icon: const Icon(Icons.edit), onPressed: editAwards),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: userData.awards.length,
            itemBuilder: (context, index) => ZoomTapAnimation(
              end: 1.1,
              child: ListTile(
                dense: true,
                title: Text(
                  userData.awards[index].title,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  ),
                ),
                subtitle: Text(
                  userData.awards[index].body,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderAchivements() {
    return Container(
      padding: const EdgeInsets.all(32),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Achivements',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Edit
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: editAchivements,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: userData.achivements.length,
            itemBuilder: (context, index) {
              final achivement = userData.achivements[index];
              return ZoomTapAnimation(
                end: 1.1,
                child: ListTile(
                  dense: true,
                  title: Text(
                    achivement.title,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  subtitle: Text(
                    achivement.body,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future editAccount() async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const AccountEditPage(),
      ),
    );
    LoadAccount();
  }

  Future editAwards() async {
    List<UserAward> result = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ProfileAwardEdit(
          userAwards: userData.awards,
        ),
      ),
    );

    UserData _userData = userData.copyWith(awards: result);

    userData = _userData;

    await UserManager.saveUser();

    setState(() {});
  }

  Future editAchivements() async {
    List<UserAchivement> result = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ProfileAchivementEdit(
          userAchivements: userData.achivements,
        ),
      ),
    );

    UserData _userData = userData.copyWith(achivements: result);

    userData = _userData;

    await UserManager.saveUser();

    setState(() {});
  }
}

class AccountAPI {
  static Future<void> logout() async {
    UserManager.logout();
  }

  static Future<void> login() async {}
}
