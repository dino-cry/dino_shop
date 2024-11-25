import 'package:dino_shop/pages/dino_register/widget/product_contents.dart';
import 'package:dino_shop/pages/dino_register/widget/product_image.dart';
import 'package:dino_shop/pages/dino_register/widget/product_name.dart';
import 'package:dino_shop/pages/dino_register/widget/product_price.dart';
import 'package:flutter/material.dart';

class DinoRegisterPage extends StatelessWidget {
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
                ProductName(),
                SizedBox(height: 8),
                ProductPrice(),
                SizedBox(height: 8),
                ProductContents(),
                SizedBox(height: 8),
                register(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

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
