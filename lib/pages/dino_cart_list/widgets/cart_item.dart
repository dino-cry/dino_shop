import 'package:dino_shop/model/product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  Product item;
  int count;
  void Function(Product item, bool isPositive) updateCartItem;
  void Function(Product item) removeCartItem;

  CartItem(this.item, this.count, this.updateCartItem, this.removeCartItem);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // 제품 이미지
          ProductImage(),

          // 제품 이름, 갯수 등 정보
          CartItemControl(context),
        ],
      ),
    );
  }

  Expanded CartItemControl(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Spacer(),
              IconButton(
                padding: EdgeInsets.only(top: 10),
                onPressed: () {
                  widget.removeCartItem(widget.item);
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
                  widget.item.name,
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
              Text("${widget.item.price * widget.count}원"),
            ],
          )
        ],
      ),
    );
  }

  Container ProductImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.item.image.first),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Row ControlItemCount() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            widget.updateCartItem(widget.item, false);
          },
          icon: Icon(Icons.remove_circle_outline),
        ),
        Text("${widget.count}개"),
        IconButton(
          onPressed: () {
            widget.updateCartItem(widget.item, true);
          },
          icon: Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}