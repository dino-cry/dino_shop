import 'package:dino_shop/pages/dino_contents/widgets/product_default_info.dart';
import 'package:dino_shop/pages/dino_contents/widgets/product_spec.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipRect(
          child: Image.asset(
            'assets/images/product/01.jpg',
            width: 430,
            height: 280,
            fit: BoxFit.cover,
          ),
        ),
        ProductDefaultInfo(),
        const Divider(),
        ProductSpec()
      ],
    );
  }
}
