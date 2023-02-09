import 'package:flutter/material.dart';
import 'ItemDetails.dart';

class ItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.all( 5.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('10/10', 'Ronnie Coleman', '../assets/ronnie.png',
                      false, false, context),
                  _buildCard('10/10', 'Urss', '../assets/urs.png',
                      true, false, context),
                  _buildCard('10/10', 'Chris Bumstead',
                      '../assets/cbum.png', false, true, context),
                  _buildCard('10/10', 'Sergio', '../assets/sergio.png',
                      false, false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItemDetail(
                      assetPath: imgPath,
                      cookieprice:price,
                      cookiename: name
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Colors.red[700])
                                : Icon(Icons.favorite_border,
                                color: Colors.red[700])
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 85.0,
                          width: 85.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: Colors.red[700],
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Text('ver',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color.fromARGB(255, 250, 3, 3),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0)),
                              Icon(Icons.video_file,
                                  color: Color.fromARGB(255, 247, 0, 0), size: 16.0)
                            ],
                            if (added) ...[
                              Text('ver',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color.fromARGB(255, 253, 3, 3),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0)),
                              Icon(Icons.video_file,
                                  color: Color.fromARGB(255, 252, 2, 2), size: 16.0),
                            ]
                          ]))
                ]))));
  }
}
