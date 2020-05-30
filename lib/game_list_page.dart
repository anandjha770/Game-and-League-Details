import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_experiment/game_details.dart';
import 'package:flutter_app_experiment/widgets/all_widget.dart';
import 'package:http/http.dart' as http;

class GameListPage extends StatefulWidget {
  @override
  _GameListPageState createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  var useData;
  var response;

  var url = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php";

  @override
  void initState() {
    super.initState();
    getAllSportsDetails();
  }

  getAllSportsDetails() async {
    response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    setState(() {
      useData = jsonData["sports"];
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
                    return Card(
                      color: Colors.pink,
                      shape: Border.all(width: 1),
                      elevation: 4.0,
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        leading: Hero(
                          tag: gameData["strSportThumb"],
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(gameData["strSportThumb"]),
                            radius: 35,
                          ),
                        ),
                        title: Text("${gameData["strSport"]}",
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500,color: Colors.white)),
                        subtitle: Text("${gameData["strFormat"]}",
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500,color: Colors.white)),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GameDetails(gameData: gameData)));
                        },
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        ));
  }
}
