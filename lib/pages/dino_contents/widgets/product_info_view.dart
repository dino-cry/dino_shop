import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_contents/widgets/product_default_info.dart';
import 'package:dino_shop/pages/dino_contents/widgets/product_spec.dart';
import 'package:flutter/material.dart';

class ProductInfoView extends StatelessWidget {
  Product item;
  
  ProductInfoView(this.item);

  @override
  Widget build(BuildContext context) {
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
        ProductSpec()
      ],
    );
  }
}
