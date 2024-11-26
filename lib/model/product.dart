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

  String getPrice() {
    return price > 0 ? MONEY_FORMAT.format(price) : "무료";
  }
}

List<Product> productList = [
  Product(
      name: 'pink dino',
      price: 11000,
      contents: 'pink dinosaur doll\n',
      image: ['assets/images/product/doll/pink_dino.png']),
  Product(
      name: 'yellow dino',
      price: 9000,
      contents: 'yellow dinosaur doll\n',
      image: ['assets/images/product/doll/yellow_dino.png']),
  Product(
      name: 'green dino',
      price: 9000,
      contents: 'green dinosaur doll\n',
      image: ['assets/images/product/doll/green_dino.png']),
  Product(
      name: 'yellow tiny dino',
      price: 5000,
      contents: 'yellow tiny dinosaur doll\n',
      image: ['assets/images/product/doll/yellow_tiny_dino.png']),
  Product(
      name: 'yellowgreen dino',
      price: 9000,
      contents: 'yellowgreen dinosaur doll\n',
      image: ['assets/images/product/doll/yellowgreen_dino.png']),
  Product(
      name: 'rubber dino',
      price: 9000,
      contents: 'rubber dinosaur doll\n',
      image: ['assets/images/product/doll/rubber_dino.png']),
  Product(
      name: 'rainbow dino',
      price: 5000,
      contents: 'rainbow dinosaur doll\n',
      image: ['assets/images/product/doll/rainbow_dino.png']),
  Product(
      name: 'tyranno',
      price: 9000,
      contents: 'rubber tyranno doll\n',
      image: ['assets/images/product/doll/tyranno.png']),
  Product(
      name: 'tyranno figure',
      price: 5000,
      contents: 'tiny green tyranno figure\n',
      image: ['assets/images/product/figure/tyranno_figure.png']),
  Product(
      name: 'velociraptor set',
      price: 25000,
      contents: 'velociraptor figure set\n',
      image: ['assets/images/product/figure/velociraptor.png']),
  Product(
      name: 'dino figure set',
      price: 21000,
      contents: 'dinosaur figure set\n',
      image: ['assets/images/product/figure/figure_set.png']),
  Product(
      name: 'colorful set',
      price: 25000,
      contents: 'colorful dinosaur figure set\n',
      image: ['assets/images/product/figure/colorful_set.png']),
  Product(
      name: 'tiny set',
      price: 21000,
      contents: 'tiny dinosaur figure set\n',
      image: ['assets/images/product/figure/tiny_set.png']),
  Product(
      name: 'keyring set 1',
      price: 18000,
      contents: 'dinosaur key ring set 1\n',
      image: ['assets/images/product/ETC/keyring1.png']),
  Product(
      name: 'keyring set 2',
      price: 15000,
      contents: 'dinosaur key ring set 2\n',
      image: ['assets/images/product/ETC/keyring2.png']),
  Product(
      name: 'dino bag 1',
      price: 22000,
      contents: 'mint dinosaur bag 1\n',
      image: ['assets/images/product/ETC/dinobag1.png']),
  Product(
      name: 'dino bag 2',
      price: 23000,
      contents: 'rainbow dinosaur bag 2\n',
      image: ['assets/images/product/ETC/dinobag2.png']),
  Product(
      name: 'dino blanket',
      price: 18000,
      contents: 'dinosaur blanket\n',
      image: ['assets/images/product/ETC/dinoblanket.png'])
];
