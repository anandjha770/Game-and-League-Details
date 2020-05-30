import 'package:flutter/material.dart';
import 'package:flutter_app_experiment/league_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllLeagueInACountry extends StatefulWidget {
  final String searchQuery;

  AllLeagueInACountry({@required this.searchQuery});

  @override
  _AllLeagueInACountryState createState() => _AllLeagueInACountryState();
}

class _AllLeagueInACountryState extends State<AllLeagueInACountry> {
  TextEditingController searchController = new TextEditingController();

  List useData = [];

  getAllLeagueInCountry(String query) async {
    var searchResponse = await http.get(
        "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?c=$query");
    useData = jsonDecode(searchResponse.body)["countrys"];

    setState(() {});
  }

  @override
  void initState() {
    getAllLeagueInCountry(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Text("All League"),
        ),
        body: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: useData.length,
              itemBuilder: (context, index) {
                var leagueData = useData[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LeagueDetails(leagueData: leagueData,)));
                  },
                  child: Card(
                    shape: Border.all(width: 1),
                    color: Colors.pink,
                    child: Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "League Name: " + leagueData["strLeague"],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text("Gender: " + leagueData["strGender"],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
