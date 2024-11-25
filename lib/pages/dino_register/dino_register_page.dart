import 'package:dino_shop/pages/dino_register/widget/product_contents.dart';
import 'package:dino_shop/pages/dino_register/widget/product_image.dart';
import 'package:dino_shop/pages/dino_register/widget/product_name.dart';
import 'package:dino_shop/pages/dino_register/widget/product_price.dart';
import 'package:flutter/material.dart';

class DinoRegisterPage extends StatefulWidget {
  @override
  State<DinoRegisterPage> createState() => _DinoRegisterPageState();
}

class _DinoRegisterPageState extends State<DinoRegisterPage> {
  late String name;
  late int price;
  late String contents;
  late List<Path> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공룡은 크아앙'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ProductImage(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 8),
                ProductName(name),
                SizedBox(height: 8),
                ProductPrice(),
                SizedBox(height: 8),
                ProductContents(),
                SizedBox(height: 15),
                register(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  /// 등록하기 버튼
  SizedBox register() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('등록하기'),
        style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(Color.fromARGB(255, 165, 231, 143)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration customInputDecoration() {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}
