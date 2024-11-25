import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_list/product_card.dart';
import 'package:dino_shop/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 별 아이콘 정의
IconData star = Icons.star_rate_rounded;
Icon yellowStar = Icon(
  star,
  size: 25,
  color: const Color(0xFFFFD700),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DinoListPage(),
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}

class DinoListPage extends StatefulWidget {
  const DinoListPage({super.key});

  @override
  State<DinoListPage> createState() => _DinoListPageState();
}

class _DinoListPageState extends State<DinoListPage> {

  // 좋아요 상태 리스트 (각 제품마다 별도의 좋아요 상태를 관리)
  late List<bool> screenStars;

  @override
  void initState() {
    super.initState();
    screenStars = List<bool>.filled(productList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 리스트'),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 열의 개수
            crossAxisSpacing: 10, // 열 간격
            mainAxisSpacing: 10, // 행 간격
            childAspectRatio: 0.7, // 항목의 가로:세로 비율
          ),
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            final product = productList[index]; // 현재 항목 데이터
            return ProductCard(
              product: product,
              isFavorite: screenStars[index],
              onFavoritePressed: () {
                setState(() {
                  screenStars[index] = !screenStars[index]; // 상태 토글
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // 버튼을 눌렀을 때 수행할 동작 추가 가능
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
