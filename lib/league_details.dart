import 'package:flutter/material.dart';

class LeagueDetails extends StatelessWidget {

  final leagueData;

  const LeagueDetails({Key key, @required this.leagueData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anand"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                shape: Border.all(width: 2),
                margin: EdgeInsets.only(left: 6,right: 6,bottom: 4),
                child: Container(
                    padding: EdgeInsets.all(4.0),
                    margin: EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Text(leagueData["strDescriptionEN"],style: TextStyle(fontSize: 20),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
