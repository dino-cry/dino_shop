import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/product.dart';
import 'package:flutter/material.dart';

IconData star = Icons.star_rate_rounded;
Icon yellowStar = Icon(
  star,
  size: 25,
  color: const Color(0xFFFFD700),
);

class ProductDefaultInfo extends StatelessWidget {
  Product item;

  ProductDefaultInfo(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                item.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Text(
                '${item.getPrice()}원',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              yellowStar,
              yellowStar,
              yellowStar,
              yellowStar,
              yellowStar,
              Text(
                ' (50)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              const Icon(
                Icons.share_outlined,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.favorite_border_outlined,
                size: 30,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: double.infinity,
            height: 70,
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '무료배송  -  12/25 이내 도착 예정',
                    style: TextStyle(fontSize: 17.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
