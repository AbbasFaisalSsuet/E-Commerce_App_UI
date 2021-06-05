import 'package:e_commerce_app/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'profile_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('E~Commerce App UI'),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notification_add),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        bottomNavigationBar: (BottomAppBar(
          color: Theme.of(context).primaryColorDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SearchPage();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProfilePage();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.account_box)),
            ],
          ),
        )),
        body: Stack(
          children: [
            BodyApp(),
            ProductCard(),
          ],
        ));
  }
}

class BodyApp extends StatefulWidget {
  const BodyApp({Key? key}) : super(key: key);

  @override
  _BodyAppState createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  List<String> cateogories = [
    'Electrnoics',
    'Apparels',
    'Jewellary',
    'Shoes',
    'Health & Beauty',
    'All Categories',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cateogories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    cateogories[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: selectedIndex == index
                          ? Colors.white
                          : Colors.white60,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 2,
                  width: 50,
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final title = [
      "Iphone 12 Pro",
      "Iphone 11",
      "Iphone 11 X",
      "Samsung Note 10",
      "Mac Book Pro",
      "Xiaomi Note 10",
      "Realme Note 8",
      "Core i9 7th Gen",
      "Dell Laptop Core i7",
      "hP laptop Core i9"
    ];

    final images = [
      Image.asset('assets/images/1.jpg'),
      Image.asset('assets/images/2.jpg'),
      Image.asset('assets/images/3.jpg'),
      Image.asset('assets/images/4.jpg'),
      Image.asset('assets/images/5.jpg'),
      Image.asset('assets/images/6.jpg'),
      Image.asset('assets/images/7.jpg'),
      Image.asset('assets/images/8.jpg'),
      Image.asset('assets/images/9.jpg'),
      Image.asset('assets/images/10.jpg'),
    ];

    final prices = [900, 800, 100, 100, 5000, 900, 900, 60000, 60000, 90000];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 70),
            height: 430,
            // width: double.infinity,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black54,
            ),
            child: Column(
              children: [
                Text(
                  title[index],
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 150,
                  child: images[index],
                ),
                SizedBox(height: 20),
                Text(
                  "\$ ${prices[index]}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '5.0 (23 reviews)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 9),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(height: 20),
                FlatButton(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
