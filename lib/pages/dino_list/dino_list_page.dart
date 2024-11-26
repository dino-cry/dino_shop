import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_list/widgets/product_card.dart';
import 'package:dino_shop/pages/dino_register/dino_register_page.dart';
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
    // productList.removeRange(0, productList.length);
    return Scaffold(
      appBar: CustomAppBar(title: APP_TITLE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: productList.isEmpty ? NoItemsMessage() : GridViewProductList(),
      ),

      // 상품 추가 플로팅 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DinoRegisterPage();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget NoItemsMessage() {
    return Container(
      child: Center(
        child: Text(NO_ITEMS_MESSAGE),
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
        final item = productList[index]; // 현재 항목 데이터
        return ProductCard(
          item: item,
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
