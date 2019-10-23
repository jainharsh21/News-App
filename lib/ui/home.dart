import 'package:flutter/material.dart';
import 'package:news_app/ui/news_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

  @override
  Widget build(BuildContext context) {
    
    var newsTopics = ["Business","Entertainment","Health","Science","Sports","Technology"];
    var topicName = "";
    var myGridView = GridView.builder(
      itemCount: newsTopics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context ,int index){
        return GestureDetector(
          child: Card(
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            elevation: 15.0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
              child: Text(newsTopics[index]),
            ),
          ),
          onTap: (){
            // debugPrint(newsTopics[index]);
            topicName = newsTopics[index];
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>NewsScreen("$topicName")));

          },
        );
      } ,
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
      ),
      body: myGridView,
    );
  }
}