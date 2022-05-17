// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Good Morning'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeIndex = 0;

  //List cardList = [Item1(), Item2(), Item3(), Item4()];
  List cardList = [Item5(), Item6(), Item7(), Item8()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 1; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  String cardNumber = '3878952902754';
  String expiryDate = '23 june';
  String cardHolderName = 'Jessi khuman';
  String cvvCode = '322';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.account_circle_rounded,
            size: 38,
            color: Colors.grey,
          ),

          // ignore: prefer_const_constructors
          title: RichText(
            text: const TextSpan(
              text: "Good Morning",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: "\nJessi Khuman",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: const [
            Icon(
              Icons.add_rounded,
              color: Color.fromARGB(202, 94, 13, 200),
              size: 28,
            ),
            Padding(padding: EdgeInsets.only(right: 20))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              " ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const Text(
              "May 2022",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                  items: cardList.map((card) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: card);
                      },
                    );
                  }).toList(),
                ),
                buildIndicator(),
              ],
            ),
            Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    (Container(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Outstanding Amount",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text(
                                  "\$ 32,329.50",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Minimun Due",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text(
                                  "\$ 3516.01",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [Text("Due Date"), Text("Pay by")],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "03 May'22",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                "24 May'22",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          OutlineButton(
                            disabledBorderColor: Colors.red,
                            highlightedBorderColor: Colors.indigo,
                            borderSide: const BorderSide(color: Colors.red),
                            onPressed: () {},
                            child: const Text("2 days left"),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (() {}),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.only(right: 100, left: 100),
                      ),
                      child: const Text("Pay Now"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: cardList.length,
        effect: const JumpingDotEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: Colors.grey,
            activeDotColor: Colors.black),
      );
}

// ignore: use_key_in_widget_constructors
class Item1 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "541249587864",
      expiryDate: "22 08",
      cardHolderName: "TOMCY KHUMAN",
      cvvCode: "443",
      showBackView: false,
      cardBgColor: Colors.purple,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}

// ignore: use_key_in_widget_constructors
class Item2 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "435749587864",
      expiryDate: "23 01",
      cardHolderName: "JESSI KHUMAN",
      cvvCode: "323",
      showBackView: false,
      cardBgColor: Colors.indigo,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}

// ignore: use_key_in_widget_constructors
class Item3 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "375949580860",
      expiryDate: "20 03",
      cardHolderName: "MACY CHANU",
      cvvCode: "323",
      showBackView: false,
      cardType: CardType.americanExpress,
      cardBgColor: Colors.blue,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}

// ignore: use_key_in_widget_constructors
class Item4 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "4332949580860",
      expiryDate: "20 03",
      cardHolderName: "RENCHI KHUMAN",
      cvvCode: "311",
      showBackView: false,
      cardType: CardType.discover,
      cardBgColor: Colors.teal,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}

// ignore: use_key_in_widget_constructors
class Item5 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.indigo[400],
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Current Balance ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "\$ 25,427.26",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "HDFC Bank",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          "**** **** ****  6454",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      " Expiry Date",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      "12/24",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Item6 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.purple[400],
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Current Balance ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "\$ 242.32",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Canara Bank",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          "**** **** ****  2014",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      " Expiry Date",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      "14/31",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Item7 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.teal[400],
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Current Balance ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "\$ 4,337.23",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "UCO Bank",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          "**** **** ****  3234",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      " Expiry Date",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      "15/26",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Item8 extends StatelessWidget {
  get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.orange[400],
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Current Balance ",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "\$ 23,337.23",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "PNB National Bank",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          "**** **** ****  0094",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      " Expiry Date",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      "12/22",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
