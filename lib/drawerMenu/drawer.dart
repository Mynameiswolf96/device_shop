import 'package:device_shop/texts/app_text.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: const [
        UserAccountsDrawerHeader(
          accountName: Text(AppText.accountName),
          accountEmail: Text(AppText.accountEmail),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/avatar/avatar.jpg'),
          ),
        ),
        ListTile(
          title: Text(AppText.firstItemInDrawer),
        ),
        Divider(),
        ListTile(
          title: Text(AppText.secondItemInDrawer),
        ),
        Divider(),
        ListTile(
          title: Text(AppText.thirstItemInDrawer),
        ),
        Divider(),
        ListTile(
          title: Text(AppText.fourItemInDrawer),
        ),
      ],
    ));
  }
}
