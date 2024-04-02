import 'package:device_shop/device_shop.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      home: DeviceShop(),
    );
  }
}
