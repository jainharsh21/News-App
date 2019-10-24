import 'package:flutter/material.dart';
import 'package:news_app/ui/news_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var newsTopics = [
      "Business",
      "Entertainment",
      "Health",
      "Science",
      "Sports",
      "Technology"
    ];
    var topicName = "";
    var myGridView = GridView.builder(
      itemCount: newsTopics.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(16, 25, 17, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 5.0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                newsTopics[index],
                style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 30.0,
                    color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            // debugPrint(newsTopics[index]);
            topicName = newsTopics[index];
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewsScreen("$topicName")));
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(
            fontFamily: 'Billabong',
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: myGridView,
    );
  }
}
