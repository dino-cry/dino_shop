import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_list/widgets/product_card.dart';
import 'package:dino_shop/pages/login/login_page.dart';
import 'package:dino_shop/theme.dart';
import 'package:dino_shop/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

// 별 아이콘 정의
IconData star = Icons.star_rate_rounded;
Icon yellowStar = Icon(
  star,
  size: 25,
  color: const Color(0xFFFFD700),
);

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
      appBar: CustomAppBar(title: APP_TITLE),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GridViewProductList()),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // 버튼을 눌렀을 때 수행할 동작 추가 가능
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  GridView GridViewProductList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 열의 개수
        crossAxisSpacing: 20, // 열 간격
        mainAxisSpacing: 0, // 행 간격
        childAspectRatio: 0.6, // 항목의 가로:세로 비율
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
    );
  }
}
