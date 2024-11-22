import 'package:dino_shop/model/product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  Product item;

  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // 제품 이미지
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.image.first),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // 제품 이름, 갯수 등 정보
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.only(top: 10),
                      onPressed: () {
                        print("delete this item!!");
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        item.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // 갯수 조절 버튼
                    ControlItemCount(),

                    Spacer(),

                    // 가격 표시
                    Text("9,000원"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row ControlItemCount() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            print("delete this item!!");
          },
          icon: Icon(Icons.remove_circle_outline),
        ),
        Text("N개"),
        IconButton(
          onPressed: () {
            print("delete this item!!");
          },
          icon: Icon(Icons.remove_circle_outline),
        ),
      ],
    );
  }
}
