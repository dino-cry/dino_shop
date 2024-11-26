import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_list/dino_list_page.dart';
import 'package:dino_shop/pages/dino_register/widgets/product_contents.dart';
import 'package:dino_shop/pages/dino_register/widgets/product_image.dart';
import 'package:dino_shop/pages/dino_register/widgets/product_name.dart';
import 'package:dino_shop/pages/dino_register/widgets/product_price.dart';
import 'package:dino_shop/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
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

  final _formKey = GlobalKey<FormState>();

  /// 상품 이름 지정하는 메서드
  void setName(String newName) {
    setState(() {
      name = newName;
    });
  }

  /// 상품 가격 지정하는 메서드
  void setPrice(String newPrice) {
    setState(() {
      price = int.parse(newPrice);
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
      appBar: CustomAppBar(title: "상품 등록"),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                // 상품 이미지
                child: ProductImage(images, selectImage, deleteImage),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 8),
                  // 상품 이름
                  ProductName(setName),
                  SizedBox(height: 8),
                  // 상품 가격
                  ProductPrice(setPrice),
                  SizedBox(height: 8),
                  // 상품 설명
                  ProductContents(setContents),
                  SizedBox(height: 15),
                  // 등록하기 버튼
                  register(),
                ]),
              ),
            ],
          ),
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
        onPressed: () async {
          if (images.length >= 1 && _formKey.currentState!.validate()) {
            var imagePath =
                List.generate(images.length, (int i) => images[i]!.path);
            var product = Product(
                name: name, price: price, contents: contents, image: imagePath);

            // 상품 리스트에 등록
            productList.add(product);

            // 등록 확인
            await confirmDialog(context, '등록이 완료되었습니다.');

            // 뒤로가기(상품 리스트 페이지로)
            // Navigator.pop(context);

            // 리스트 페이지 임시로 호출
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DinoListPage();
              }),
            );
          } else if (images.length <= 0) {
            // 이미지 한 개 이상 선택이 안되어있으면
            await confirmDialog(context, '이미지를 한 개 이상 선택하세요.');
          }
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

  /// 확인 Dialog
  Future<dynamic> confirmDialog(BuildContext context, String text) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(text),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('확인'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
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
