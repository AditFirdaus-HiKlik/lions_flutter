import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lions_flutter/Pages/Account/account_edit_page.dart';
import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/services/account_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account account = Account();

  @override
  void initState() {
    super.initState();
    LoadAccount();
  }

  // Load
  Future LoadAccount() async {
    account = await AccountManager.getAccount(sync: true);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
