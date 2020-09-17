import 'package:flutter/material.dart';
List<Map<String, String>> exampledata=[{'title':'Sonu ke tittu','rating':'7.8'},
{'title':'Dhoom','rating':'7.8'},
{'title':'Dhoom2','rating':'8.7'},
{'title':'Dhoom3','rating':'7.7'},
{'title':'Bang Bang','rating':'8.0'},
{'title':'Zindagi Na Milegi Dobara','rating':'9.0'},
{'title':'Krrish','rating':'8.7'},
{'title':'Krrish2','rating':'8.2'},
{'title':'Krrish3','rating':'7.0'},


];
class ListBuilderBasic extends StatefulWidget {
  @override
  _ListBuilderBasicState createState() => _ListBuilderBasicState();
}

class _ListBuilderBasicState extends State<ListBuilderBasic> {
  @override
  Widget build(BuildContext context) {
    return Container(
    height:300,
    child: ListView.builder(
      itemBuilder:(ctx,index) {
       return Card(
         color: Colors.deepOrange[400],
        child:Column(
          children:<Widget>[
            Container(
              child:Text('Movie Name:'+exampledata[index]['title'],
              style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 30,
              ),),
            padding: EdgeInsets.all(5),
            ),
            Container(
              child: Text('Movie ratings'+exampledata[index]['rating'],
              style: TextStyle(
                fontWeight:FontWeight.w500,
                fontSize: 20,
              ),),
            padding: EdgeInsets.all(5),
            ),
            
          ]
        )
       );
      },
      itemCount:exampledata.length
    ),     
    );
  }
}