import 'package:dino_shop/constant.dart';

class Product {
  String name;
  int price;
  String contents;
  List<String> image;

  Product({
    required this.name,
    required this.price,
    required this.contents,
    required this.image,
  });

  String getPrice(){
    return price > 0 ? MONEY_FORMAT.format(price) : "무료";
  }
}

List<Product> productList = [
  Product(
      name: 'pink_dino',
      price: 11000,
      contents: 'pink dinosaur doll',
      image: ['assets/images/product/doll/pink_dino.png']),
  Product(
      name: 'yellow_dino',
      price: 9000,
      contents: 'yellow dinosaur doll',
      image: ['assets/images/product/doll/yellow_dino.png']),
  Product(
      name: 'green_dino',
      price: 9000,
      contents: 'green dinosaur doll',
      image: ['assets/images/product/doll/green_dino.png']),
  Product(
      name: 'yellow_tiny_dino',
      price: 5000,
      contents: 'yellow tiny dinosaur doll',
      image: ['assets/images/product/doll/yellow_tiny_dino.png']),
  Product(
      name: 'yellowgreen_dino',
      price: 9000,
      contents: 'yellowgreen dinosaur doll',
      image: ['assets/images/product/doll/yellowgreen_dino.png']),
  Product(
      name: 'rubber_dino',
      price: 9000,
      contents: 'rubber dinosaur doll',
      image: ['assets/images/product/doll/rubber_dino.png']),
  Product(
      name: 'rainbow_dino',
      price: 5000,
      contents: 'rainbow dinosaur doll',
      image: ['assets/images/product/doll/rainbow_dino.png']),
  Product(
      name: 'tyranno',
      price: 9000,
      contents: 'rubber tyranno doll',
      image: ['assets/images/product/doll/tyranno.png']),
  Product(
      name: 'tyranno_figure',
      price: 5000,
      contents: 'tiny green tyranno figure',
      image: ['assets/images/product/figure/tyranno_figure.png']),
  Product(
      name: 'velociraptor_set',
      price: 25000,
      contents: 'velociraptor figure set',
      image: ['assets/images/product/figure/velociraptor.png']),
  Product(
      name: 'dino_figure_set',
      price: 21000,
      contents: 'dinosaur figure set',
      image: ['assets/images/product/figure/figure_set.png']),
  Product(
      name: 'colorful_set',
      price: 25000,
      contents: 'colorful dinosaur figure set',
      image: ['assets/images/product/figure/colorful_set.png']),
  Product(
      name: 'tiny_set',
      price: 21000,
      contents: 'tiny dinosaur figure set',
      image: ['assets/images/product/figure/tiny_set.png']),
  Product(
      name: 'keyringset1',
      price: 18000,
      contents: 'dinosaur key ring set 1',
      image: ['assets/images/product/ETC/keyring1.png']),
  Product(
      name: 'keyringset2',
      price: 15000,
      contents: 'dinosaur key ring set 2',
      image: ['assets/images/product/ETC/keyring2.png']),
  Product(
      name: 'dinobag1',
      price: 22000,
      contents: 'mint dinosaur bag 1',
      image: ['assets/images/product/ETC/dinobag1.png']),
  Product(
      name: 'dinobag2',
      price: 23000,
      contents: 'rainbow dinosaur bag 2',
      image: ['assets/images/product/ETC/dinobag2.png']),
  Product(
      name: 'dino_blanket',
      price: 18000,
      contents: 'dinosaur blanket',
      image: ['assets/images/product/ETC/dinoblanket.png'])
];
