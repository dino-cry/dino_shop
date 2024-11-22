import 'package:dino_shop/model/product.dart';

class Cart {
  Map<Product, int> cartItems = {};
  int totalPrice = 0;

  // 상품을 카트에 추가하는 메소드
  void addItem(Product product, int count) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + count;
    } else {
      cartItems[product] = count;
    }
    // calculateTotalPrice();
  }

  // 카트 안에서 상품 갯수 변경하는 메소드
  void updateCartItem(Product item, bool isPositive) {
    if (cartItems.containsKey(item)) {
      cartItems[item] = cartItems[item]! + (isPositive ? 1 : -1);
    } else {
      cartItems[item] = 1;
    }
    calculateTotalPrice();
  }

  void removeCartItem(Product item){
    cartItems.remove(item);
    calculateTotalPrice();
  }

  // 모든 상품들을 다 더한 총 합계금액을 계산하는 메소드
  void calculateTotalPrice() {
    totalPrice = 0;
    cartItems.forEach((product, count) {
      totalPrice += product.price * count;
    });
  }
}
