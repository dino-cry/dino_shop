import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_register/widget/product_contents.dart';
import 'package:dino_shop/pages/dino_register/widget/product_image.dart';
import 'package:dino_shop/pages/dino_register/widget/product_name.dart';
import 'package:dino_shop/pages/dino_register/widget/product_price.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DinoRegisterPage extends StatefulWidget {
  @override
  State<DinoRegisterPage> createState() => _DinoRegisterPageState();
}

class _DinoRegisterPageState extends State<DinoRegisterPage> {
  late String name;
  late int price;
  late String contents;
  List<XFile?> images = []; // 보여질 이미지들

  /// 상품 이름 지정하는 메서드
  void setName(String newName) {
    setState(() {
      name = newName;
    });
  }

  /// 상품 가격 지정하는 메서드
  void setPrice(int newPrice) {
    setState(() {
      price = newPrice;
    });
  }

  /// 상품 설정 지정하는 메서드
  void setContents(String newContents) {
    setState(() {
      contents = newContents;
    });
  }

  /// 상품 이미지 지정하는 메서드
  void selectImage(List<XFile?> image) {
    setState(() {
      images.addAll(image);
    });
  }

  /// 등록한 이미지 삭제하는 메서드
  void deleteImage(XFile? image) {
    setState(() {
      images.remove(image);
    });
  }

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
              child: ProductImage(images, selectImage, deleteImage),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 8),
                ProductName(setName),
                SizedBox(height: 8),
                ProductPrice(setPrice),
                SizedBox(height: 8),
                ProductContents(setContents),
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
        onPressed: () {
          var imagePath =
              List.generate(images.length, (int i) => images[i]!.path);
          Product(
            name: name,
            price: price,
            contents: contents,
            image: imagePath,
          );
        },
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
