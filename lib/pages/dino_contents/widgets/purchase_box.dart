import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/model/product.dart';
import 'package:flutter/material.dart';

class PurchaseBox extends StatefulWidget {
  Product item;

  PurchaseBox(this.item);

  @override
  State<PurchaseBox> createState() => _PurchaseBoxState();
}

class _PurchaseBoxState extends State<PurchaseBox> {
  var quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) quantity--;
    });
  }

  void clearQuantity(){
    setState(() {
      quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상품 갯수 조절 버튼
                QuantityControlButton(),

                Text(
                  '총 금액 : ${widget.item.price * quantity}원',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold),
                ),
                // Container(
                //   width: 40,
                //   height: 40,
                //   color: Colors.white,
                //   child: const Icon(Icons.add_shopping_cart_outlined),
                // ),
                IconButton(
                  onPressed: () {
                    // 카트에 아이템 담기
                    Cart userCart = Cart();
                    userCart.addItem(widget.item, quantity);

                    // 상품 갯수 초기화
                    clearQuantity();
                  },
                  icon: Container(
                    width: 40,
                    height: 40,
                    color: Colors.white,
                    child: Icon(Icons.add_shopping_cart_outlined),
                  ),
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Container QuantityControlButton() {
    return Container(
      // width: 100,
      height: 40,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => decrementQuantity(),
            icon: Icon(Icons.remove_rounded),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(quantity.toString()),
          ),
          IconButton(
            onPressed: () => incrementQuantity(),
            icon: Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
