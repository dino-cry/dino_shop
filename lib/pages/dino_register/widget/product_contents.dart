import 'package:flutter/material.dart';

class ProductContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '상품 설명',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
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
