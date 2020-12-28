import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  List tmp = [
    {
      "name": "",
      "quantity": 1,
    }
  ];
  Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

  void insert_data() async {
    var url = "http://zhyar99-001-site1.itempurl.com/";
    final String body = json.encoder.convert(orderList);
    final response =
        await http.post(url, body: {"body": body});
    final responseJson = json.decode(response.body);
    print(responseJson);
  }

  var quantityBtn = "";

  List orderList = [];

  List foods = [
    {
      "name": "Chicken burger",
      "price": 10.0,
    },
    {
      "name": "Chicken burger",
      "price": 10.0,
    },
    {
      "name": "Chicken burger",
      "price": 10.0,
    },
    {
      "name": "Chicken burger",
      "price": 10.0,
    },
    {
      "name": "Chicken burger",
      "price": 10.0,
    },
    {
      "name": "Chicken burger",
      "price": 10.0,
    },
    {
      "name": "Chicken burger",
      "price": 10.0,
    },
  ];

  add_food(String name) {
    tmp[0]["name"] = name;
    var temp = jsonEncode(tmp);
    setState(() {
      orderList += jsonDecode(temp);
    });
    print(orderList);
  }

  update_quantity(int index) {
    if (quantityBtn == "add") {
      setState(() {
        orderList[index]["quantity"]++;
      });
    } else if (quantityBtn == "minus") {
      if (orderList[index]["quantity"] > 1) {
        setState(() {
          orderList[index]["quantity"]--;
        });
      }
    }
  }

  remove_food(int index) {
    // setState(() {
    //   orderList.removeAt(index);
    // });
  }

  Widget new_ordger() {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xl: 8,
              lg: 8,
              md: 6,
              sm: 12,
              xs: 12,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.all(20),
                    height: height - 250,
                    child: SingleChildScrollView(
                      child: ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                            child: ResponsiveGridRow(
                              children: [
                                for (var i = 0; i < foods.length; i++)
                                  ResponsiveGridCol(
                                    md: 4,
                                    xl: 2,
                                    lg: 2,
                                    sm: 6,
                                    xs: 12,
                                    child: InkWell(
                                      onTap: () {
                                        add_food(foods[i]["name"]);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: Image.asset(
                                                'assets/img/burger.png',
                                                height: 60,
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              child: AutoSizeText(
                                                foods[i]["name"],
                                                maxLines: 1,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 100,
                                              child: AutoSizeText(
                                                foods[i]["price"].toString() +
                                                    '\$',
                                                style: TextStyle(
                                                    color: dark_green),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            ResponsiveGridCol(
              xl: 4,
              lg: 4,
              md: 6,
              sm: 12,
              xs: 12,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: height - 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                ),
                              ),
                              alignment: Alignment.topCenter,
                              child: AutoSizeText(
                                'ORDER',
                                style: TextStyle(
                                  color: dark_green,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                child: ResponsiveGridRow(
                                  children: [
                                    for (var i = 0; i < orderList.length; i++)
                                      ResponsiveGridCol(
                                        lg: 12,
                                        md: 12,
                                        sm: 12,
                                        xl: 12,
                                        xs: 12,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.topCenter,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(orderList[i]["name"]),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        quantityBtn = "add";
                                                        print(quantityBtn);
                                                        update_quantity(i);
                                                      },
                                                      child: Container(
                                                        height: 16,
                                                        width: 16,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            border: Border.all(
                                                                color:
                                                                    dark_green,
                                                                width: 1)),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons.add,
                                                            color: dark_green,
                                                            size: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(orderList[i]
                                                            ["quantity"]
                                                        .toString()),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        quantityBtn = "minus";
                                                        print(quantityBtn);
                                                        update_quantity(i);
                                                      },
                                                      child: Container(
                                                        height: 16,
                                                        width: 16,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            border: Border.all(
                                                                color:
                                                                    dark_green,
                                                                width: 1)),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: dark_green,
                                                            size: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  remove_food(i);
                                                },
                                                child: Container(
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 18,
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      insert_data();
                    },
                    child: ResponsiveGridRow(
                      children: [
                        ResponsiveGridCol(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: dark_green,
                            ),
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            height: 40,
                            width: 200,
                            alignment: Alignment.center,
                            child: Text(
                              'ORDER',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return app_bar('New Order', new_ordger());
  }
}
