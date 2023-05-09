// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:lions_flutter/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lions_flutter/Pages/Auth/login_page.dart';
import 'Tabs/home_events.dart';
import 'Tabs/home_locations.dart';
import 'Tabs/home_members.dart';
import 'Tabs/home_news.dart';
import 'package:lions_flutter/Pages/settings_page.dart';
import 'package:lions_flutter/app/app_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> sportToogle = ['football', 'volley', 'basket', 'fencing'];
List<bool> sportToogleSelected = [true, false, false, false];

List<String> sportCategories = [];

class _HomePageState extends State<HomePage> {
  void toSettings() async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void toSignIn() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            Text(
              "Lions Club 307 B1",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
          elevation: 1,
        ),
        body: SafeArea(
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            children: [
              HomeNews(),
              HomeEvents(),
              HomeMembers(),
              HomeLocations(),
            ],
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: _bottomBar(),
        drawer: DrawerWidget(),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 16,
          ),
        ],
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TabBar(
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: const Icon(Icons.newspaper),
              text: AppLocalizations.of(context)!.news,
            ),
            Tab(
              icon: const Icon(Icons.calendar_month),
              text: AppLocalizations.of(context)!.events,
            ),
            Tab(
              icon: const Icon(Icons.card_membership),
              text: AppLocalizations.of(context)!.members,
            ),
            Tab(
              icon: const Icon(Icons.location_on),
              text: AppLocalizations.of(context)!.locations,
            ),
          ],
        ),
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final void Function() onPressed;
  final Color color;
  final Color backgroundColor;

  const QuickActionButton(this.label, this.iconData, this.onPressed, this.color,
      this.backgroundColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          shadowColor: Colors.transparent),
      child: SizedBox(
        height: 48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            Text(
              label,
              style: TextStyle(
                  color: color, fontSize: 8, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

// Sport Toogle Buttons, multiple selection
class SportToggleButtons extends StatefulWidget {
  final List<String> sportList;
  final List<bool> isSelected;
  final void Function(List<bool>) onSelectionChanged;

  const SportToggleButtons(
      this.sportList, this.isSelected, this.onSelectionChanged,
      {super.key});

  @override
  State<SportToggleButtons> createState() => _SportToggleButtonsState();
}

class _SportToggleButtonsState extends State<SportToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return GFButtonBar(
      children: List.generate(
        widget.sportList.length,
        (index) => GFButton(
          onPressed: () {
            setState(() {
              widget.isSelected[index] = !widget.isSelected[index];
              widget.onSelectionChanged(widget.isSelected);
            });
          },
          text: widget.sportList[index],
          color: widget.isSelected[index] ? appSwatch[600]! : Colors.white,
          textStyle: TextStyle(
              color: widget.isSelected[index] ? Colors.white : Colors.black),
          size: GFSize.SMALL,
          shape: GFButtonShape.pills,
        ),
      ),
    );
  }
}
