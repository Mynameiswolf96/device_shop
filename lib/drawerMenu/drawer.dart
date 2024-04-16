import 'package:device_shop/texts/app_images.dart';
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

class ItemInDrawer extends StatelessWidget {
  const ItemInDrawer({
    required this.nameItemDrawer,
    super.key,
  });

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
  (index) =>
      ItemInDrawer(nameItemDrawer: AppText.listOfNameOfDrawerItem[index]),
);
