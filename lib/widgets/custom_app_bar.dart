import 'package:dino_shop/model/manager.dart';
import 'package:dino_shop/pages/dino_cart_list/dino_cart_list_page.dart';
import 'package:dino_shop/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.0), // 선의 높이 설정
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                // 하단 선 설정
                color: Colors.transparent, // 선 색상 (회색)
                width: 3, // 선 두께
              ),
            ),
            gradient: LinearGradient(
              // 그라데이션 설정
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFA5E78F), // 시작 색상 (연두)
                Color(0xFFFAEA94), // 끝 색상 (노랑)
              ],
            ),
          ),
        ),
      ),
      scrolledUnderElevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            if (!isLogined) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            } else {
              print("로그아웃?");
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text("로그아웃"),
                    content: Text("로그아웃하시겠습니까?"),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("취소"),
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("확인", style: TextStyle(color: Colors.blue)),
                        isDefaultAction: true,
                        onPressed: () {
                          isLogined = false;
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          icon: Icon(
            Icons.account_circle_rounded,
            color: Color(0xFFFFD700),
          ),
        ),
        IconButton(
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name !=
                DinoCartListPage.routeName) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DinoCartListPage();
                  },
                  settings: RouteSettings(name: DinoCartListPage.routeName),
                ),
              );
            }
          },
          icon: Icon(Icons.shopping_cart, color: Color(0xFFFFD700)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
