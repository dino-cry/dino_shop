import 'package:dino_shop/pages/dino_contents/purchase_box.dart';
import 'package:dino_shop/theme.dart';
import 'package:flutter/material.dart';

IconData star = Icons.star_rate_rounded;
Icon yellowStar = Icon(
  star,
  size: 25,
  color: const Color(0xFFFFD700),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DinoContentsPage(),
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}

// 민트색 코드:32FAC5 노란색 코드:FFF068

class DinoContentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dino Shop'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ClipRect(
                  child: Image.asset(
                    'assets/images/product/dino_figure.avif',
                    width: 430,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 30, right: 30, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '프리미엄 공룡 피규어 세트',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Text(
                            '16,000원',
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
                ),
                Divider(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('상품정보',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    Image.asset('assets/images/product/01.jpg')
                  ],
                )
              ],
            ),
          ),
          PurchaseBox()
        ],
      ),
    );
  }
}
