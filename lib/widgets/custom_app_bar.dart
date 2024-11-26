import 'package:dino_shop/model/cart.dart';
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
      title: Text(title),
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
                        child: Text("확인"),
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
          icon: Icon(Icons.account_circle_rounded),
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
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
