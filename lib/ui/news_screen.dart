import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/util.dart' as util;


class NewsScreen extends StatefulWidget {
  String topicName;
  NewsScreen(this.topicName);
  @override
  _NewsScreenState createState() => _NewsScreenState(this.topicName);
}

class _NewsScreenState extends State<NewsScreen> {
  String apiId = '951b6fe097884996b05c2bd2cd3f8d44';
  String topicName;
  _NewsScreenState(this.topicName);

  void showData() async {
    Map news  = await getNews(util.apiId, util.defaultNews);
    print(news.toString());
  }

  @override
  void initState() {
    super.initState();
    showData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$topicName",style: TextStyle(
          fontFamily: 'Billabong',
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
      ),
    );
  }

  Future<Map> getNews(String apiId,String topicName) async{
    String apiUrl = "https://newsapi.org/v2/top-headlines?country=in&category=$topicName&apiKey=$apiId";
    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }



}