import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductCard(
      {super.key,
      required this.product,
      required bool isFavorite,
      required Null Function() onFavoritePressed});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(widget.product['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; // 좋아요 상태 변경
                  });
                },
                icon: Icon(
                  Icons.star_rate_rounded,
                  size: 25,
                  color: isFavorite ? const Color(0xFFFFD700) : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          widget.product['brand'],
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.product['description'],
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              widget.product['price'],
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.star_rate_rounded,
              size: 15,
              color: const Color(0xFFFFD700),
            ),
            const SizedBox(width: 5),
            Text(
              '${widget.product['rating']} (${widget.product['reviews']})',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
