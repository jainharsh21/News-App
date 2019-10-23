import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  String topicName;
  NewsScreen(this.topicName);
  @override
  _NewsScreenState createState() => _NewsScreenState(this.topicName);
}

class _NewsScreenState extends State<NewsScreen> {
  String topicName;
  _NewsScreenState(this.topicName);
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
}