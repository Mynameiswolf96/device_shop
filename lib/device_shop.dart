import 'package:device_shop/colors/app_colors.dart';
import 'package:device_shop/drawerMenu/drawer.dart';
import 'package:device_shop/texts/app_images.dart';
import 'package:device_shop/texts/app_text.dart';
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
        elevation: 0,
      ),
      body: Column(
        children: [
          const SearchString(),
          Expanded(
            child: ListView(
              children: const [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 170,
                  width: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: CatalogOfProducts(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CatalogRowWidget(
                  icon: Icons.local_fire_department,
                  catalogName: AppText.nameOfFrequentlyPurchasedCatalog,
                ),
                OftenBuyCatalog(),
                CatalogRowWidget(
                  icon: Icons.percent,
                  catalogName: AppText.nameOfDiscountCatalog,
                ),
                DiscountCatalog(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 48,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 35,
          color: AppColor.grey,
          child: const Icon(Icons.search),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          width: 331,
          height: 35,
          color: AppColor.grey,
          child: const TextField(
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
    );
  }
}

class WidgetProduct extends StatelessWidget {
  final String productName;
  final String imageName;
  final double imageHeight;
  final double imageWidth;

  final double containerTextWidth;
  final double containerTextHeight;

  const WidgetProduct({
    required this.productName,
    required this.imageName,
    required this.imageHeight,
    required this.imageWidth,
    required this.containerTextHeight,
    required this.containerTextWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: AppColor.white,
          child: Image.asset(
            imageName,
            height: imageHeight,
            width: imageWidth,
          ),
        ),
        SizedBox(
          height: containerTextHeight,
          width: containerTextWidth,
          child: Text(
            productName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class OftenBuyCatalog extends StatelessWidget {
  const OftenBuyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.23, right: 16.23, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listOFWidgetProductOftenBuy,
      ),
    );
  }
}

class DiscountCatalog extends StatelessWidget {
  const DiscountCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.23, right: 16.23, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listOFWidgetOfDiscountProduct,
      ),
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
          imageHeight: 50,
          imageWidth: 50.98,
          productName: AppText.listOfNameProductChapter[index],
          imageName: AppImages.listOfImagesNameMain[index],
          containerTextHeight: 32,
          containerTextWidth: 90,
        );
      },
    );
  }
}

List<Widget> listOFWidgetProductOftenBuy = List.generate(
  AppText.listOfNameFrequentlyPurchased.length,
  (index) => WidgetProduct(
    imageHeight: 100,
    imageWidth: 77.66,
    productName: AppText.listOfNameFrequentlyPurchased[index],
    imageName: AppImages.listOFImagesNameOften[index],
    containerTextHeight: 120,
    containerTextWidth: 65,
  ),
);
List<Widget> listOFWidgetOfDiscountProduct = List.generate(
  AppText.listOfNameOfDiscount.length,
  (index) => WidgetProduct(
    imageHeight: 100,
    imageWidth: 77.66,
    productName: AppText.listOfNameOfDiscount[index],
    imageName: AppImages.listOfImagesDiscountsMain[index],
    containerTextHeight: 120,
    containerTextWidth: 65,
  ),
);

class CatalogRowWidget extends StatelessWidget {
  const CatalogRowWidget({
    required this.icon,
    required this.catalogName,
    super.key,
  });

  final IconData icon;
  final String catalogName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15),
          child: Icon(icon),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(catalogName),
      ],
    );
  }
}
