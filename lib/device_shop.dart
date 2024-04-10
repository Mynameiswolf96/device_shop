import 'package:device_shop/drawerMenu/drawer.dart';
import 'package:device_shop/texts/app_images.dart';
import 'package:device_shop/texts/app_text.dart';
import 'package:flutter/material.dart';

class DeviceShop extends StatelessWidget {
  const DeviceShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white60,
          title: const Text(
            AppText.nameOfApp,
            style: TextStyle(fontSize: 24, color: Colors.purple),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const searchString(),
            const SizedBox(
              height: 48,
            ),
            Container(
              height: 200,
              width: 150,
              child: const Expanded(child: CatalogOfProducts()),
            ),
            const SizedBox(
              height: 67,
            ),
            const OftenBuyRowWidget(),
            const SizedBox(
              height: 20,
            ),
            const OftenBuyCatalog(),
            const DiscountRowWidget(),
            const SizedBox(
              height: 20,
            ),
            const DiscountCatalog(),
          ],
        ),
      ),
    );
  }
}

class IconList extends StatelessWidget {
  const IconList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 3),
      child: const Icon(Icons.list),
    );
  }
}

class OftenBuyRowWidget extends StatelessWidget {
  const OftenBuyRowWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 5),
          child: const Icon(Icons.local_fire_department),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(AppText.nameOfFrequentlyPurchasedCatalog),
        ),
      ],
    );
  }
}

class DiscountRowWidget extends StatelessWidget {
  const DiscountRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 5),
          child: const Icon(Icons.percent),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(AppText.nameOfDiscountCatalog),
        ),
      ],
    );
  }
}

class searchString extends StatelessWidget {
  const searchString({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          color: Colors.grey,
          child: const Icon(Icons.search),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          alignment: Alignment.topCenter,
          width: 365,
          height: 30,
          color: Colors.grey,
          child: const TextField(
            decoration: InputDecoration(
              hintText: AppText.searchInCatalog,
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetProduct extends StatelessWidget {
  final String nameOfProduct;
  final String nameOfImage;
  final double widthOfContainerText;
  final double heightOfContainerText;

  WidgetProduct({
    super.key,
    required this.nameOfProduct,
    required this.nameOfImage,
    required this.heightOfContainerText,
    required this.widthOfContainerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            nameOfImage,
            height: 50.89,
            width: 50,
          ),
          Container(
            height: heightOfContainerText,
            width: widthOfContainerText,
            child: Text(
              nameOfProduct,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class OftenBuyCatalog extends StatelessWidget {
  const OftenBuyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: listOFWidgetProductOftenBuy,
    );
  }
}

class DiscountCatalog extends StatelessWidget {
  const DiscountCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: listOFWidgetOfDiscountProduct,
    );
  }
}

class CatalogOfProducts extends StatelessWidget {
  const CatalogOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 2, // Отступы по оси X
        crossAxisSpacing: 3, // Отступы по оси Y
      ),
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return WidgetProduct(
          nameOfProduct: AppText.listOfNameProductChapter[index],
          nameOfImage: AppImages.listOfImagesNameMain[index],
          heightOfContainerText: 28,
          widthOfContainerText: 90,
        );
      },
    );
  }
}

List<Widget> listOFWidgetProductOftenBuy = List.generate(
  3,
  (index) => WidgetProduct(
      nameOfProduct: AppText.listOfNameFrequentlyPurchased[index],
      nameOfImage: AppImages.listOFImagesNameOften[index],
      heightOfContainerText: 130,
      widthOfContainerText: 65),
);
List<Widget> listOFWidgetOfDiscountProduct = List.generate(
  3,
  (index) => WidgetProduct(
      nameOfProduct: AppText.listOfNameOfDiscount[index],
      nameOfImage: AppImages.listOfImagesDiscountsMain[index],
      heightOfContainerText: 130,
      widthOfContainerText: 65),
);
