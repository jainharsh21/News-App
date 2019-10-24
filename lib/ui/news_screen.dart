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
  Map news;
  List articles;
  String topicName;
  List titles;
  String title="";
  String description = "";
  String urlToImage = "";
  _NewsScreenState(this.topicName);

  void showData() async {
    news = await getNews(util.apiId, topicName.toLowerCase());
    articles = news["articles"];
    title = articles[0]["title"];
    description = articles[0]["description"]; 
    urlToImage = articles[0]["urlToImage"];    
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
          title: Text(
            "$topicName",
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            RaisedButton(
              child: Text("Get news on $topicName!"),
              onPressed: () async {
                news = await getNews(util.apiId, topicName);
                // articles = news['articles'][0]['title'];
                // titles.add(news['articles'][0]['title']);
                articles = news["articles"];
                title = articles[0]["title"];
                description = articles[0]["description"];    
                urlToImage = articles[0]["urlToImage"];

                print(articles[0]['title']);
                setState(() {
                  if (!mounted) return;
                  title = title;
                  description = description;
                  urlToImage = urlToImage;
                });
              },
            ),

            Image.network(urlToImage),

            Card(
              child: ListTile(
                title: Text(title),
                subtitle: Text(description),
              ),
            )
            
          ],
        ));
  }

  Future<Map> getNews(String apiId, String topicName) async {
    String apiUrl =
        "https://newsapi.org/v2/top-headlines?country=in&category=$topicName&apiKey=$apiId";
    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }
}
