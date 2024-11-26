import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_contents/widgets/product_info_view.dart';
import 'package:dino_shop/pages/dino_contents/widgets/purchase_box.dart';
import 'package:dino_shop/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

// 민트색 코드:32FAC5 노란색 코드:FFF068

class DinoContentsPage extends StatelessWidget {
  Product item;

  DinoContentsPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: APP_TITLE),
      body: Column(
        children: [
          Expanded(
            child: ProductInfoView(item),
          ),
          PurchaseBox(item),
        ],
      ),
    );
  }
}
