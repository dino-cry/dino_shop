import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 20),
          Stack(
            children: [
              Container(
                height: 64,
                width: 64,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    '/Users/t2024-m0194/imyujin/workspace/dino_shop/assets/images/product/01.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Positioned(
                left: 40,
                top: 40,
                child: CloseButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      iconColor: WidgetStatePropertyAll(Colors.blue),
                      iconSize: WidgetStatePropertyAll(20)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
