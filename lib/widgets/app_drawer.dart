import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({required this.permanentlyDisplay, Key? key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amberAccent,
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('User'),
                  accountEmail: Text('user@email.com'),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.android),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("PageTitles.home"),
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("PageTitles.gallery"),
                ),
                ListTile(
                  leading: const Icon(Icons.slideshow),
                  title: const Text("PageTitles.slideshow"),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("PageTitles.settings"),
                ),
              ],
            ),
          ),
          if (widget.permanentlyDisplay)
            const VerticalDivider(
              width: 1,
            )
        ],
      ),
    );
  }

}