import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_cart_list/dino_cart_list_page.dart';
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
                    if (quantity > 0) PurchaseConfirmationDialog(context);
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
          title: Text("담기 확인"),
          content: Text("${widget.item.name} ${quantity}개를 장바구니에 담으시겠습니까?"),
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

                // 카트에 아이템 담기
                Cart userCart = Cart();
                userCart.addItem(widget.item, quantity);

                // 상품 갯수 초기화
                clearQuantity();

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
          title: Text("담기 완료"),
          content: Text("선택한 상품이 장바구니에 담겼습니다."),
          actions: [
            CupertinoDialogAction(
              child: Text("닫기"),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text("장바구니 보러가기"),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DinoCartListPage();
                    },
                    settings: RouteSettings(name: DinoCartListPage.routeName),
                  ),
                );
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
