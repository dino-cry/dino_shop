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

  // 가격 정렬 상태 관리
  bool isAscending = true;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //위아래 화살표
                isAscending
                    ? Icon(Icons.arrow_downward)
                    : Icon(Icons.arrow_upward),
                //가격 정렬 텍스트 버튼
                TextButton(
                  onPressed: () {
                    setState(() {
                      isAscending = !isAscending;
                      productList.sort((a, b) => isAscending
                          ? a.price.compareTo(b.price)
                          : b.price.compareTo(a.price));
                    });
                  },
                  child: Text(isAscending ? '낮은 가격순' : '높은 가격순'),
                ),
              ],
            ),
          ),
          Expanded(
            // Expanded로 GridView를 감쌈
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: productList.isEmpty
                  ? NoItemsMessage()
                  : GridViewProductList(),
            ),
          ),
        ],
      ),

      // 상품 추가 플로팅 버튼
      floatingActionButton: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFFAEA94), Color(0xFFA5E78F)],
                stops: [0.2, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white, width: 5),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF005C05).withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(0, 3))
            ]),
        child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DinoRegisterPage();
                }),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
              shadows: [
                Shadow(
                    color: Color(0x9045AA4A),
                    offset: Offset(0, 2),
                    blurRadius: 20)
              ],
            )),
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
