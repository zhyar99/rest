import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../app_bar.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {

  Widget orders_page()
  {
    return SingleChildScrollView(
      child: Container(
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              child: Container(

              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return app_bar('Order', orders_page());
  }
}