import 'package:device_shop/app.dart';
import 'package:device_shop/drawerMenu/drawer.dart';
import 'package:device_shop/utils/colors/app_colors.dart';
import 'package:device_shop/utils/texts/app_description.dart';
import 'package:device_shop/utils/texts/app_images.dart';
import 'package:device_shop/utils/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeviceShop extends StatelessWidget {
  const DeviceShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      drawer: const MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title: const Text(
          AppText.nameOfApp,
          style: TextStyle(
            fontSize: 24,
            color: AppColor.purple,
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SearchString(),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 200,
                  child: CatalogProducts(),
                ),
                const SizedBox(
                  height: 30,
                ),
                CatalogRowWidget(
                  icon: Icons.local_fire_department,
                  titleName: AppText.frequentlyPurchasedCatalog,
                  listOFWidgetProduct: listOFWidgetProductOftenBuy,
                ),
                const SizedBox(
                  height: 30,
                ),
                CatalogRowWidget(
                  icon: Icons.percent,
                  titleName: AppText.discountCatalog,
                  listOFWidgetProduct: listOFDiscountProduct,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchString extends StatelessWidget {
  const SearchString({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: screenSize.width,
      height: 35,
      color: AppColor.grey,
      padding: const EdgeInsets.only(left: 15),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              cursorHeight: 30,
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: AppText.searchInCatalog,
                hintStyle: TextStyle(
                  color: AppColor.white,
                  fontSize: 13,
                ),
                contentPadding: EdgeInsets.only(bottom: 18),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ProductImageSize { small, big }

class WidgetProduct extends StatelessWidget {
  final String productName;
  final String imageName;
  final ProductImageSize imageSize;
  final VoidCallback onTap;


  const WidgetProduct({
    required this.productName,
    required this.imageName,
    required this.onTap,
    this.imageSize = ProductImageSize.small,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            imageName,
            fit: BoxFit.contain,
            height: screenSize.width *
                (imageSize.index == ProductImageSize.small.index ? 0.15 : 0.25),
          ),
        ),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          productName,
          textAlign: TextAlign.center,
          // overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 2, // Отступы по оси X
        crossAxisSpacing: 3, // Отступы по оси Y
      ),
      itemCount: AppText.listOfNameProductChapter.length,
      itemBuilder: (BuildContext context, int index) {
        return WidgetProduct(
          productName: AppText.listOfNameProductChapter[index],
          imageName: AppImages.listOfImagesNameMain[index],
          onTap: () {
            context.push(
              '/page_product',
              extra: {
                'name': AppText.listOfNameProductChapter[index],
                'image': AppImages.listOfImagesNameMain[index],
              },
            );
          },
        );
      },
    );
  }
}

List<Widget> listOFWidgetProductOftenBuy = List.generate(
  AppText.listFrequentlyPurchased.length,
  (index) => WidgetProduct(
    productName: AppText.listFrequentlyPurchased[index],
    imageName: AppImages.listOFImagesNameOften[index],
    imageSize: ProductImageSize.big,
    onTap: () {
      App.ctx?.push(
        '/page_product',
        extra: {
          'name': AppText.listFrequentlyPurchased[index],
          'image': AppImages.listOFImagesNameOften[index],
          'description': AppDescription.listOfDescriptionOften[index],
        },
      );
    },
  ),
);
List<Widget> listOFDiscountProduct = List.generate(
  AppText.listOfDiscount.length,
  (index) => WidgetProduct(
    productName: AppText.listOfDiscount[index],
    imageName: AppImages.listOfImagesDiscountsMain[index],
    imageSize: ProductImageSize.big,
    onTap: () {
      App.ctx?.push(
        '/page_product',
        extra: {
          'name': AppText.listOfDiscount[index],
          'image': AppImages.listOfImagesDiscountsMain[index],
          'description': AppDescription.listOfDescriptionSale[index],
        },
      );
    },
  ),
);

class CatalogRowWidget extends StatelessWidget {
  const CatalogRowWidget({
    required this.icon,
    required this.titleName,
    required this.listOFWidgetProduct,
    super.key,
  });

  final IconData icon;
  final String titleName;
  final List<Widget> listOFWidgetProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              child: Icon(icon),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(titleName),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.23, right: 16.23, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: listOFWidgetProduct.map(
              (e) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: e,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
