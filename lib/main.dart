import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
            CarouselSlider(
              options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  autoPlayInterval: const Duration(seconds: 2)),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                            CreditCardWidget(
                              cardNumber: cardNumber,
                              expiryDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cardBgColor: Colors.teal,

                              cvvCode: cvvCode,
                              // ignore: non_constant_identifier_names
                              showBackView: isCvvFocused,
                              onCreditCardWidgetChange:
                                  // ignore: non_constant_identifier_names
                                  (CreditCardBrand) {}, //true when you want to show cvv(back) view
                            ),
                          ],
                        ));
                  },
                );
              }).toList(),
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(64),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 32,
                      color: Colors.green,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Container(
                        height: 32,
                        width: 32,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      height: 64,
                      color: Colors.blue,
                    ),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  children: <Widget>[
                    Container(
                      height: 64,
                      width: 128,
                      color: Colors.purple,
                    ),
                    Container(
                      height: 32,
                      color: Colors.yellow,
                    ),
                    Center(
                      child: Container(
                        height: 32,
                        width: 32,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
