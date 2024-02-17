import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainShoesExample(),
    );
  }
}

class MainShoesExample extends StatelessWidget {
  final List<String> imageUrls = [
    'https://www.ndure.com/cdn/shop/files/1_7c3abe72-948c-4e1b-a502-35083e6e5f16.jpg',
    'https://www.ndure.com/cdn/shop/files/2_3fb02234-93d1-4e4b-9a27-ed204a895447.jpg',
    'https://www.ndure.com/cdn/shop/files/3_553b8d17-9bee-4534-bc9c-50055749ef15.jpg',
    'https://www.ndure.com/cdn/shop/files/4_41c2cb98-a670-4270-a665-d17f1fcb3f83.jpg',
    'https://www.ndure.com/cdn/shop/files/5_aa2ca25d-cbd8-4091-bf22-8201dbad50e2.jpg',
  ];
  final List<String> imageUrls1 = [
    'https://www.ndure.com/cdn/shop/files/1_89f61310-58ab-4cbd-a338-c06989149a62.jpg',
    'https://www.ndure.com/cdn/shop/files/2_09e7760d-4c99-4e7d-816e-9f18c9673b07.jpg',
    'https://www.ndure.com/cdn/shop/files/3_797369f9-8e9d-42ae-a833-15bed17c9c6b.jpg',
    'https://www.ndure.com/cdn/shop/files/4_a866b697-7539-4e51-accc-f2a68bc06351.jpg',
    'https://www.ndure.com/cdn/shop/files/5_2eb81c8d-581d-4552-aa76-d535ad1219f8.jpg'
  ];
  List<Color> Clrs = [
    Colors.black,
    Colors.grey,
  ];

  final List<String> ColorShoes = ['Black', 'Grey'];
  int i = 0;
  List<String> size = ['Small', 'Medium', 'Large'];
  @override
  final ColorVariable = 0.obs;
  final SizeVariable = 0.obs;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Getx State Management"),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Obx(
                  () => Column(
                    children: [
                      Center(
                          child: CarouselSlider(
                        options: CarouselOptions(
                          height: 300.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                        ),
                        items: ColorVariable.value == 0
                            ? imageUrls.map((imageUrl) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: 300,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList()
                            : imageUrls1.map((imageUrl) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: 300,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(), // Return an empty list if i is neither 0 nor 1
                      )),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Color:',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    for (int i = 0; i < 2; i++)
                                      InkWell(
                                        onTap: () {
                                          print(i);

                                          i == 0
                                              ? ColorVariable.value = 0
                                              : ColorVariable.value = 1;
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          height: 30,
                                          width: i == 0
                                              ? ColorVariable.value == 0
                                                  ? 120
                                                  : 80
                                              : ColorVariable.value == 1
                                                  ? 120
                                                  : 80,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Clrs[i],
                                            border: Border.all(
                                              color: i == 0
                                                  ? ColorVariable.value == 0
                                                      ? Colors.blueGrey
                                                      : Colors.white
                                                  : ColorVariable.value == 1
                                                      ? Colors.blueGrey
                                                      : Colors.white,
                                              width: 4.0, // Border width
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            ColorShoes[i],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Size:',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    for (int i = 0; i < 3; i++)
                                      InkWell(
                                        onTap: () {
                                          i == 0
                                              ? SizeVariable.value = 0
                                              : i == 1
                                                  ? SizeVariable.value = 1
                                                  : SizeVariable.value = 2;
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 6),
                                          height: 30,
                                          width: i == 0
                                              ? SizeVariable.value == 0
                                                  ? 90
                                                  : 65
                                              : i == 1
                                                  ? SizeVariable.value == 1
                                                      ? 90
                                                      : 65
                                                  : SizeVariable.value == 2
                                                      ? 90
                                                      : 65,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            border: Border.all(
                                              color: i == 0
                                                  ? SizeVariable.value == 0
                                                      ? Colors.black
                                                      : Colors.white
                                                  : i == 1
                                                      ? SizeVariable.value == 1
                                                          ? Colors.black
                                                          : Colors.white
                                                      : SizeVariable.value == 2
                                                          ? Colors.black
                                                          : Colors.white,
                                              width: 3.0, // Border width
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(size[i]),
                                        ),
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '''Product Description\nThese shoes will keep you cool during your toughest games.They have been made with good quality Mesh material that gives them durability and breathability.These shoes feature a round toe shape, a cushioned insole, and a lace-up style.The PU outsole provides grip and a good resistance to slip.''',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    )),
                Container(
                  height: 60,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 35,
                        color: Colors.black,
                      ),
                      Text(
                        'Add to Bag',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
