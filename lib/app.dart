import 'package:device_shop/authentication/pageauthorization.dart';
import 'package:device_shop/authentication/pageregistration.dart';
import 'package:device_shop/device_shop.dart';
import 'package:device_shop/pageproduct/pageproduct.dart';
import 'package:device_shop/utils/texts/app_images.dart';
import 'package:device_shop/utils/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  static BuildContext? get ctx =>
      _router.routerDelegate.navigatorKey.currentContext;
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PageAuthorization(),
      ),
      GoRoute(
        path: '/page_registration',
        builder: (context, state) => const PageRegistration(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const DeviceShop(),
      ),
      GoRoute(
        path: '/page_product',
        builder: (context, state) {
          final extra = state.extra as Map?;
          return PageProduct(
            productName: extra != null ? extra['0'] : AppText.listOfNameProduct,
            imageName:
                extra != null ? extra['1'] : AppImages.listOfImagesNameMain,
            description: extra != null ? extra['2'] : {},
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
