import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_contents/widgets/product_default_info.dart';
import 'package:flutter/material.dart';

class ProductInfoView extends StatelessWidget {
  Product item;

  ProductInfoView(this.item);

  @override
  Widget build(BuildContext context) {
    // 더미텍스트. 디자인 작업 후 삭제. -> 수정완료
    item.contents =
        "상품명 : ${item.name}\n상품설명 : ${item.contents}구매금액 : ${item.price}원";

    return ListView(
      children: [
        ClipRect(
          child: Image.asset(
            item.image[0],
            width: 430,
            height: 280,
            fit: BoxFit.cover,
          ),
        ),

        // 상품 기초정보
        ProductDefaultInfo(item),

        const Divider(),

        // 상품 상세정보
        ProductSpec(),
      ],
    );
  }

  Column ProductSpec() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(25),
          child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('상품정보', style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        ClipRRect(child: Image.asset(item.image[0], width: 430)),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          child: Text(
            item.contents,
            style: TextStyle(fontSize: 17.5),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
