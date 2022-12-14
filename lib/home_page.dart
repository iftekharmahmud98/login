import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'body_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          leading: isLargeScreen
              ? null
              : IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Logo",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                if (isLargeScreen) Expanded(child: _navBarItems())
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProfilePage()),
                        );
                      },
                      icon: const Icon(Icons.person))
              ),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: const NewsFeedPage(),
      ),
    );
  }

  Widget _drawer() =>
      Drawer(
        child: ListView(
          children: _menuItems
              .map((item) =>
              ListTile(
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                title: Text(item),
              ))
              .toList(),
        ),
      );

  Widget _navBarItems() =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) =>
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
        )
            .toList(),
      );
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];