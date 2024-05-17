import 'package:device_shop/utils/texts/app_images.dart';
import 'package:device_shop/utils/texts/app_text.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(AppText.accountName),
            accountEmail: Text(AppText.accountEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(AppImages.avatarImage),
            ),
          ),
          ...listOfItemsDrawer,
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({required this.nameItemDrawer, super.key});

  final String nameItemDrawer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nameItemDrawer),
    );
  }
}

List<Widget> listOfItemsDrawer = List.generate(
  AppText.listOfNameOfDrawerItem.length,
  (index) => DrawerItem(nameItemDrawer: AppText.listOfNameOfDrawerItem[index]),
);
