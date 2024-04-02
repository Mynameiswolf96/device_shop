import 'package:flutter/material.dart';

class DeviceShop extends StatefulWidget {
  const DeviceShop({Key? key}) : super(key: key);

  @override
  State<DeviceShop> createState() => _DeviceShop();
}

class _DeviceShop extends State<DeviceShop> {
  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white60,
          title: const Text(
            'device shop',
            style: TextStyle(fontSize: 24, color: Colors.purple),
          ),
        ),
        body: ListView(
          children: const [
            IconList(),
            SizedBox(
              height: 30,
            ),
            searchString(),
            SizedBox(
              height: 48,
            ),
            CatalogOfProducts(),
            SizedBox(
              height: 67,
            ),
            OftenBuyCatalog(),
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

class searchString extends StatelessWidget {
  const searchString({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.grey,
          child: const Icon(Icons.search),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          alignment: Alignment.topLeft,
          width: 365,
          height: 24,
          color: Colors.grey,
          child: const Text(
            'Поиск в каталоге',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class WidgetProduct extends StatelessWidget {
  final String nameOfProduct;
  late final double padding;
  late final String nameOfImage;
  late final double widthOfContainer;
  late final double heightOfContainer;

  WidgetProduct({
    super.key,
    required this.nameOfProduct,
    required this.padding,
    required this.nameOfImage,
    required this.heightOfContainer,
    required this.widthOfContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            nameOfImage,
            height: 56,
            width: 56,
          ),
          Container(
            padding: EdgeInsets.only(left: padding),
            height: heightOfContainer,
            width: widthOfContainer,
            child: Text(
              nameOfProduct,
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
    return Padding(
      padding: const EdgeInsets.only(left: 37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.local_fire_department),
              SizedBox(
                width: 5,
              ),
              Text(
                'Часто покупают',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              WidgetProduct(
                heightOfContainer: 155,
                widthOfContainer: 60,
                nameOfProduct:
                    'Смартфон Samsung Galaxy S23 Ultra SM-S918B/DS 12GB/512GB',
                padding: 2,
                nameOfImage: 'assets/imagesoften/phoneOften.jpg',
              ),
              const SizedBox(
                width: 40,
              ),
              WidgetProduct(
                heightOfContainer: 130,
                widthOfContainer: 60,
                nameOfProduct: 'SHURE PGA48-XLR-E МИКРОФОН',
                padding: 12,
                nameOfImage: 'assets/imagesoften/microphoneOften.jpg',
              ),
              const SizedBox(
                width: 40,
              ),
              WidgetProduct(
                heightOfContainer: 130,
                widthOfContainer: 60,
                nameOfProduct: 'Игровая приставка Game Box G11 Pro',
                padding: 0,
                nameOfImage: 'assets/imagesoften/playstationOften.jpg',
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            children: [
              Icon(Icons.percent),
              SizedBox(
                width: 5,
              ),
              Text('Товар на скидках'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              WidgetProduct(
                heightOfContainer: 130,
                widthOfContainer: 60,
                nameOfProduct: 'Пылесос бытовой NORMANN AVC-516 ',
                padding: 3,
                nameOfImage:
                    'assets/imagesdiscounts/vacuumcleanerDiscounts.jpg',
              ),
              const SizedBox(
                width: 40,
              ),
              WidgetProduct(
                heightOfContainer: 130,
                widthOfContainer: 60,
                nameOfProduct: 'NVIDIA GM107-400-A2 GTX750TI RB',
                padding: 3,
                nameOfImage: 'assets/imagesdiscounts/videocardDiscounts.jpg',
              ),
              const SizedBox(
                width: 40,
              ),
              WidgetProduct(
                heightOfContainer: 130,
                widthOfContainer: 60,
                nameOfProduct: 'Беспроводные наушники Awei T29, черные',
                padding: 0,
                nameOfImage: 'assets/imagesdiscounts/headphonesDiscounts.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CatalogOfProducts extends StatelessWidget {
  const CatalogOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer: 70,
              nameOfProduct: 'Ноутбуки',
              padding: 3,
              nameOfImage: 'assets/imagesmain/laptopMain.png',
            ),
            const SizedBox(
              width: 10,
            ),
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer: 70,
              nameOfProduct: 'Игровые приставки',
              padding: 7,
              nameOfImage: 'assets/imagesmain/playstationMain.jpg',
            ),
            const SizedBox(
              width: 10,
            ),
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer:70,
              nameOfProduct: 'Смартфоны',
              padding: 0,
              nameOfImage: 'assets/imagesmain/phoneMain.jpg',
            ),
            const SizedBox(
              width: 10,
            ),
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer: 70,
              nameOfProduct: 'Наушники',
              padding: 0,
              nameOfImage: 'assets/imagesmain/headphonesMain.jpg',
            ),
          ],
        ),
        const SizedBox(
          height: 33,
        ),
        Row(
          children: [
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer: 70,
              nameOfProduct: 'Телевизоры',
              padding: 0,
              nameOfImage: 'assets/imagesmain/TVMain.jpg',
            ),
            const SizedBox(
              width: 10,
            ),
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer: 70,
              nameOfProduct: 'Пылесосы',
              padding: 3,
              nameOfImage: 'assets/imagesmain/vacuumcleanerMain.jpg',
            ),
            const SizedBox(
              width: 10,
            ),
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer: 70,
              nameOfProduct: 'Видеокарты',
              padding: 0,
              nameOfImage: 'assets/imagesmain/videocardMain.jpg',
            ),
            const SizedBox(
              width: 10,
            ),
            WidgetProduct(
              heightOfContainer: 30,
              widthOfContainer: 70,
              nameOfProduct: 'Микрофоны',
              padding: 0,
              nameOfImage: 'assets/imagesmain/micMain.jpg',
            ),
          ],
        ),
      ],
    );
  }
}
