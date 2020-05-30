import 'package:flutter/material.dart';

Widget appBarName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            "https://images.unsplash.com/photo-1532907977246-27059f6d7a5f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80",
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          )),
      SizedBox(
        width: 20,
      ),
      RichText(
        text: TextSpan(
          text: '',
          children: <TextSpan>[
            TextSpan(
                text: 'Game',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            TextSpan(
                text: 'Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent)),
          ],
        ),
      ),
    ],
  );
}


Widget gameHomePageGrid(String title,String url){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
    child: Stack(
      children: <Widget>[
        Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
        )
      ],
    ),
  );
}
