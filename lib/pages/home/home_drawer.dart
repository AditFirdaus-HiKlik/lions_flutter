import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lions_flutter/language_page.dart';
import 'package:lions_flutter/pages/Auth/login_page.dart';
import 'package:lions_flutter/pages/account/account_page.dart';
import 'package:lions_flutter/services/account_manager.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(),
            if (AccountManager.isLoggedIn)
              _drawerItem(
                icon: Icons.person,
                text: "Account",
                onTap: _navigateToAccountPage,
              )
            else
              _drawerItem(
                icon: Icons.login,
                text: "Sign In",
                onTap: _navigateToLoginPage,
              ),
            _drawerItem(
              icon: Icons.language,
              text: "Language",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LanguagePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _navigateToAccountPage() async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => const AccountPage()),
    );

    setState(() {});
  }

  Future _navigateToLoginPage() async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => const LoginPage()),
    );

    setState(() {});
  }

  Widget _drawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.black87,
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage("assets/icon-sports.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Lions 307 ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
