import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/models/lions_member/lions_member.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({required this.memberData, super.key});

  final LionsMember memberData;

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  LionsMember get memberData => widget.memberData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
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
              Shimmer.fromColors(
                baseColor: Colors.orange,
                highlightColor: Colors.yellow,
                child: Text(
                  memberData.district.title,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.blue,
                highlightColor: Colors.lightBlue[100]!,
                child: Text(
                  memberData.club.title,
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
                  memberData.avatar.url,
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
            memberData.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            memberData.username,
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
                      memberData.awards.toString(),
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
                      memberData.achivements.length.toString(),
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
            memberData.about,
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
              memberData.phone,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              ),
            ),
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.location_on),
            title: Text(
              memberData.address,
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
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: memberData.awards.length,
            itemBuilder: (context, index) => ZoomTapAnimation(
              end: 1.1,
              child: ListTile(
                dense: true,
                title: Text(
                  memberData.awards[index].title,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  ),
                ),
                subtitle: Text(
                  memberData.awards[index].title,
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
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: memberData.achivements.length,
            itemBuilder: (context, index) {
              final achivement = memberData.achivements[index];
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
                    achivement.description,
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
}
