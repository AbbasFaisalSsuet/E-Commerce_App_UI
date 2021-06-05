import 'package:e_commerce_app/profile_page.dart';
import 'package:flutter/material.dart';
import 'main_app.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
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
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return MyApp();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
          Container(
            margin: const EdgeInsetsDirectional.all(10),
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                searchBar(),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(top: 100),
            child: TilesView(),
          ),
        ],
      ),
    );
  }
}

Widget searchBar() {
  return Container(
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search Here !',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        icon: Icon(
          Icons.search,
          size: 50,
        ),
      ),
    ),
  );
}

class TilesView extends StatefulWidget {
  const TilesView({Key? key}) : super(key: key);

  @override
  _TilesViewState createState() => _TilesViewState();
}

class _TilesViewState extends State<TilesView> {
  @override
  Widget build(BuildContext context) {
    final titles = [
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
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: images[index],
            ),
            title: Text(
              titles[index],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                ),
                Text(
                  '23 (reviews)',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            trailing: Text(
              "\$ ${prices[index]}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
