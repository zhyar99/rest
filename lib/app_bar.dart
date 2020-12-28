import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'ui/Order.dart';
import 'ui/new_order.dart';
import 'ui/home.dart';

Color dark_green = Color(0xFF0E9F68);

Widget app_bar(String title,Widget body)
{
  return Scaffold(
    backgroundColor: Color(0xFFE2F1EA),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 150,
            child: DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 80,
                      width: 120,
                      child: Image.asset('assets/img/burger.png',fit: BoxFit.contain,),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: AutoSizeText('Admin',maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 0)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: dark_green,
              ),
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Get.to(Home());
            },
          ),
          ListTile(
            title: Text('New Order'),
            onTap: () {
              Get.to(NewOrder());
            },
          ),
          ListTile(
            title: Text('Orders'),
            onTap: () {
              Get.to(Order());
            },
          ),
        ],
      ),
    ),
    appBar: AppBar(
      title: Text(title),
      backgroundColor: Color(0xFF0E9F68),
    ),
    body: body,
  );
}