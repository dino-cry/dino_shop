import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '상품 가격',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
