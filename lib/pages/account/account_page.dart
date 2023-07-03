import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/models/member_achivement/member_achivement.dart';
import 'package:lions_flutter/models/member_award/member_award.dart';
import 'package:lions_flutter/models/member_training/member_training.dart';
import 'package:lions_flutter/pages/account/account_edit_page.dart';
import 'package:lions_flutter/pages/account/profile_achivement_edit.dart';
import 'package:lions_flutter/pages/account/profile_award_edit.dart';
import 'package:lions_flutter/pages/account/profile_training_edit.dart';
import 'package:lions_flutter/services/account_service/account_service.dart';
import 'package:shimmer/shimmer.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account account = const Account();

  @override
  void initState() {
    _loadAccount();
    super.initState();
  }

  Future _loadAccount() async {
    account = await AccountService.getLocalAccount();
    setState(() {});
    account = await AccountService.getAccount();
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
                Center(
                  child: SizedBox(
                    width: 128,
                    height: 128,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        account.avatar.url,
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
                  account.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  account.username,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
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
                    account.memberID != ""
                        ? account.memberID
                        : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Position",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  trailing: Text(
                    account.position.title != ""
                        ? account.position.title
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
                    account.district.title != ""
                        ? account.district.title
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
                    account.club.title != ""
                        ? account.club.title
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
                    account.about != "" ? account.about : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    'Contacts',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.phone),
                  title: Text(
                    account.phone != "" ? account.phone : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.email),
                  title: Text(
                    account.email != "" ? account.email : 'No information',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.location_on),
                  title: Text(
                    account.address != "" ? account.address : 'No information',
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
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: editAwards,
                    // onPressed: () {},
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: account.awards.length,
                  itemBuilder: (context, index) {
                    final awards = account.awards[index];
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
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: editAchivements,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: account.achivements.length,
                  itemBuilder: (context, index) {
                    final achivement = account.achivements[index];
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
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: editTrainings,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: account.trainings.length,
                  itemBuilder: (context, index) {
                    final achivement = account.trainings[index];
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
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: deleteAccount,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future deleteAccount() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete account'),
        content: const Text('Are you sure you want to delete your account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await AccountService.deleteAccount();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future editAccount() async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => AccountEditPage(
          account,
        ),
      ),
    );

    _loadAccount();

    setState(() {});
  }

  Future editAwards() async {
    List<MemberAward> result = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ProfileAwardEdit(
          userAwards: account.awards,
        ),
      ),
    );

    account = account.copyWith(awards: result);

    setState(() {});

    await AccountService.setAccount(account);
  }

  Future editAchivements() async {
    List<MemberAchivement> result = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ProfileAchivementEdit(
          userAchivements: account.achivements,
        ),
      ),
    );

    account = account.copyWith(achivements: result);

    setState(() {});

    await AccountService.setAccount(account);
  }

  Future editTrainings() async {
    List<MemberTraining> result = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ProfileTrainingEdit(
          trainings: account.trainings,
        ),
      ),
    );

    account = account.copyWith(trainings: result);

    setState(() {});

    await AccountService.setAccount(account);
  }
}
