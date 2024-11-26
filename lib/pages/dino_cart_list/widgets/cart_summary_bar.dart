import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartSummaryBar extends StatefulWidget {
  Cart userCart;
  CartSummaryBar(this.userCart);

  @override
  State<CartSummaryBar> createState() => _CartSummaryBarState();
}

class _CartSummaryBarState extends State<CartSummaryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Color(0xFF45AA4A),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "총 ${MONEY_FORMAT.format(widget.userCart.totalPrice)}원",
              style: TextStyle(
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 25),
            ),
            OutlinedButton(
              onPressed: () {
                // 구매하기 함수
              },
              child: Text(
                "구매하기",
                style: TextStyle(
                    fontFamily: 'Paperlogy',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                selectionColor: Colors.green,
              ),
            ),
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
          content:
              Text("선택한 상품들(총 ${widget.userCart.totalPrice}원)을 구매하시겠습니까??"),
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
                // 카트 초기화
                widget.userCart.cartItems.clear();

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
