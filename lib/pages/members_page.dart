import 'package:flutter/material.dart';
import 'package:lions_flutter/models/lions_member/lions_member.dart';
import 'package:shimmer/shimmer.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({required this.member, super.key});

  final LionsMember member;

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Member',
        ),
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
                Center(
                  child: SizedBox(
                    width: 128,
                    height: 128,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.member.avatar.url,
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
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/icon-sports.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.member.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'About',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Member ID",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  trailing: Text(
                    widget.member.memberID != ""
                        ? widget.member.memberID
                        : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "position",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  trailing: Text(
                    widget.member.position.title != ""
                        ? widget.member.position.title
                        : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "District",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  trailing: Text(
                    widget.member.district.title != ""
                        ? widget.member.district.title
                        : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Club",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  trailing: Text(
                    widget.member.club.title != ""
                        ? widget.member.club.title
                        : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.info),
                  title: Text(
                    widget.member.about != ""
                        ? widget.member.about
                        : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Awards',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: widget.member.awards.length,
                  itemBuilder: (context, index) {
                    final awards = widget.member.awards[index];
                    return ListTile(
                      dense: true,
                      title: Text(
                        awards.title,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge!.fontSize,
                        ),
                      ),
                      subtitle: Text(
                        awards.description,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium!.fontSize,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Achivements',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: widget.member.achivements.length,
                  itemBuilder: (context, index) {
                    final achivement = widget.member.achivements[index];
                    return ListTile(
                      dense: true,
                      title: Text(
                        achivement.title,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge!.fontSize,
                        ),
                      ),
                      subtitle: Text(
                        achivement.description,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium!.fontSize,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Trainings',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: widget.member.trainings.length,
                  itemBuilder: (context, index) {
                    final achivement = widget.member.trainings[index];
                    return ListTile(
                      dense: true,
                      title: Text(
                        achivement.title,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge!.fontSize,
                        ),
                      ),
                      subtitle: Text(
                        achivement.description,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium!.fontSize,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
