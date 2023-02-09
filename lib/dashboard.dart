import 'package:flutter/material.dart';
import 'BottomNavigation.dart';
import 'ItemsList.dart';

class Dashboard extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Dashboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ignore: unnecessary_new
      home: new Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            "NVS-NUTRITION",
            style: TextStyle(
                color: Color.fromARGB(255, 244, 245, 247),
                fontFamily: "Varela",
                fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.red[700],
              ),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: 200.0,
              height: 250.0,
              child: Image.network(
                '../assets/Nvs.png',
                fit: BoxFit.cover,
              ),
            ),

            Container(
              height: 150,
              color: Color.fromARGB(255, 0, 0, 0),
              child: ListView(
                padding: EdgeInsets.only(left: 20),
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Categorias",
                    style: TextStyle(fontFamily: "Verela", fontSize: 42),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Color.fromARGB(255, 238, 236, 236),
                    isScrollable: true,
                    labelColor: Colors.red[700],
                    unselectedLabelColor: Color.fromARGB(255, 224, 116, 116),
                    labelPadding: EdgeInsets.only(right: 45),
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "Documentales del fisicoculturismo",
                          style: TextStyle(fontFamily: "Varela", fontSize: 21),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 290,
              child: TabBarView(controller: _tabController, children: [
                ItemsList(),
                ItemsList(),
                ItemsList(),
              ]),
            ), //CookieItems(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CookingNavigator(),
      ),
    );
  }
}

class CookiesMasters extends StatefulWidget {
  @override
  _CookiesMastersState createState() => _CookiesMastersState();
}

class _CookiesMastersState extends State<CookiesMasters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 240, 105, 105),
    );
  }
}
