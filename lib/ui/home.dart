import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../app_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget home_page()
  {
    return SingleChildScrollView(
      child: Container(
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              lg: 4,
              md: 6,
              sm: 6,
              xs: 12,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(50, 40, 50, 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: Colors.grey[500]
                    )
                  ],
                ),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText('Yesterday Sales',maxLines: 1,style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 28,
                    ),),
                    SizedBox(height: 7,),
                    AutoSizeText('85.7\$',maxLines: 1,style: TextStyle(
                      color: dark_green,
                      fontSize: 18,
                    ),),
                  ],
                ),
              ),
            ),
            ResponsiveGridCol(
              lg: 4,
              md: 6,
              sm: 6,
              xs: 12,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(50, 40, 50, 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: Colors.grey[500]
                    )
                  ],
                ),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText('Week Sales',maxLines: 1,style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 28,
                    ),),
                    SizedBox(height: 7,),
                    AutoSizeText('85.7\$',maxLines: 1,style: TextStyle(
                      color: dark_green,
                      fontSize: 18,
                    ),),
                  ],
                ),
              ),
            ),
            ResponsiveGridCol(
              lg: 4,
              md: 6,
              sm: 6,
              xs: 12,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(50, 40, 50, 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: Colors.grey[500]
                    )
                  ],
                ),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText('Month Sales',maxLines: 1,style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 28,
                    ),),
                    SizedBox(height: 7,),
                    AutoSizeText('85.7\$',maxLines: 1,style: TextStyle(
                      color: dark_green,
                      fontSize: 18,
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return app_bar('Dashboard', home_page());
  }
}