import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/model/product.dart';
import 'package:flutter/cupertino.dart';
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

  void clearQuantity() {
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

                // 총 금액 출력
                Text(
                  '총 금액 : ${MONEY_FORMAT.format(widget.item.price * quantity)}원',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold),
                ),

                // 장바구니 담기 버튼
                IconButton(
                  onPressed: () {
                    // 팝업 출력
                    PurchaseConfirmationDialog(context);

                    // // 카트에 아이템 담기
                    // Cart userCart = Cart();
                    // userCart.addItem(widget.item, quantity);

                    // // 상품 갯수 초기화
                    // clearQuantity();
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

  Future<dynamic> PurchaseConfirmationDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("구매 확인"),
          content: Text("${widget.item.name}을 ${quantity}개 구매하시겠습니까??"),
          actions: [
            CupertinoDialogAction(
              child: Text("취소"),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text("확인"),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                PurchaseSuccessDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> PurchaseSuccessDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("구매 완료"),
          content: Text("선택한 상품이 구매되었습니다."),
          actions: [
            CupertinoDialogAction(
              child: Text("확인"),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
