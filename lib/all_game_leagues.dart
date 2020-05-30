import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_experiment/widgets/all_widget.dart';
import 'package:http/http.dart' as http;

class AllGameLeague extends StatefulWidget {

  @override
  _AllGameLeagueState createState() => _AllGameLeagueState();
}

class _AllGameLeagueState extends State<AllGameLeague> {
  var gameLeagueUrl = "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php";

  var useData;

  var response;

  @override
  void initState() {
    super.initState();
    getAllLeagueDetails();
  }

  getAllLeagueDetails() async {
    response = await http.get(gameLeagueUrl);
    var jsonData = jsonDecode(response.body);

    setState(() {
      useData = jsonData["leagues"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: appBarName(),
          elevation: 1.8,
        ),
        body: Center(
          child: response != null
              ? ListView.builder(
                  itemCount: useData == null ? 0 : useData.length,
                  itemBuilder: (context, index) {
                    var gameData = useData[index];
                    return Container(
                      height: 100,
                      child: Card(
                        color: Colors.pink,
                        shape: Border.all(width: 1),
                        elevation: 4.0,
                        margin: EdgeInsets.only(left: 8,right: 8,top: 6),
                        child: Column(
                          children: <Widget>[
                            Text("${gameData["strLeague"]}",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w500,color: Colors.white)),
                            Text("${gameData["strSport"]}",
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w500,color: Colors.white)),
                            Text("${gameData["strLeagueAlternate"]}",
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.white)),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        ));
  }
}
