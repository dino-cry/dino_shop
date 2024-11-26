import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/pages/dino_cart_list/dino_cart_list_page.dart';
import 'package:dino_shop/pages/login/login_page.dart';
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }),
            );
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
