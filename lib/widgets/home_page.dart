import 'package:flutter/material.dart';
import 'package:flutter_app_experiment/all_game_leagues.dart';
import 'package:flutter_app_experiment/all_league_by_country.dart';
import 'package:flutter_app_experiment/game_list_page.dart';
import 'package:flutter_app_experiment/widgets/all_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = new TextEditingController();
    var Url =
        "https://images.unsplash.com/photo-1553481187-be93c21490a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
    return Scaffold(
      appBar: AppBar(
        title: appBarName(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllLeagueInACountry(
                                    searchQuery: searchController.text,
                                  )));
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameListPage()));
                },
                child: gameHomePageGrid("Game", Url),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllGameLeague()));
                },
                child: gameHomePageGrid("League", Url),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
