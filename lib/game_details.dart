import 'package:flutter/material.dart';

class GameDetails extends StatelessWidget {
  final gameData;

  const GameDetails({Key key, this.gameData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameData["strSport"]),
        elevation: 0.2,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Hero(
                        tag: gameData["strSportThumb"],
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(gameData["strSportThumb"]),
                          radius: 100.0,
                        ),
                      ),
                      Text("${gameData["strSport"]}",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: Border.all(width: 2),
                margin: EdgeInsets.only(left: 6,right: 6,bottom: 4),
                child: Container(
                  padding: EdgeInsets.all(4.0),
                    margin: EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Text(gameData["strSportDescription"],style: TextStyle(fontSize: 20),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
