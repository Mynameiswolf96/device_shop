import 'package:device_shop/drawerMenu/drawer.dart';
import 'package:device_shop/utils/colors/app_colors.dart';
import 'package:device_shop/utils/texts/app_images.dart';
import 'package:device_shop/utils/texts/app_text.dart';
import 'package:flutter/material.dart';

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
                  child: CatalogOfProducts(),
                ),
                const SizedBox(
                  height: 30,
                ),
                CatalogRowWidget(
                  icon: Icons.local_fire_department,
                  titleName: AppText.nameOfFrequentlyPurchasedCatalog,
                  listOFWidgetProduct: listOFWidgetProductOftenBuy,
                ),
                const SizedBox(
                  height: 30,
                ),
                CatalogRowWidget(
                  icon: Icons.percent,
                  titleName: AppText.nameOfDiscountCatalog,
                  listOFWidgetProduct: listOFWidgetOfDiscountProduct,
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
      child: Row(
        children: [
          Container(
            height: 35,
            color: AppColor.grey,
            child: const Icon(Icons.search),
          ),
          const Expanded(
            child: TextField(
              cursorHeight: 30,
              decoration: InputDecoration(
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

  const WidgetProduct({
    required this.productName,
    required this.imageName,
    this.imageSize = ProductImageSize.small,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Image.asset(
          imageName,
          fit: BoxFit.contain,
          height: screenSize.width *
              (imageSize.index == ProductImageSize.small.index ? 0.15 : 0.25),
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

class CatalogOfProducts extends StatelessWidget {
  const CatalogOfProducts({super.key});

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
        );
      },
    );
  }
}

List<Widget> listOFWidgetProductOftenBuy = List.generate(
  AppText.listOfNameFrequentlyPurchased.length,
      (index) => WidgetProduct(
    productName: AppText.listOfNameFrequentlyPurchased[index],
    imageName: AppImages.listOFImagesNameOften[index],
    imageSize: ProductImageSize.big,
  ),
);
List<Widget> listOFWidgetOfDiscountProduct = List.generate(
  AppText.listOfNameOfDiscount.length,
      (index) => WidgetProduct(
    productName: AppText.listOfNameOfDiscount[index],
    imageName: AppImages.listOfImagesDiscountsMain[index],
    imageSize: ProductImageSize.big,
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
