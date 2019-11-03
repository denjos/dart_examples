import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:json_list/DetailPage.dart';
import 'dart:convert';

import 'User.dart';

void main()=>runApp(new App());
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home:HomePage(title:'Users')
    );
  }
}
class HomePage extends StatefulWidget{
  final String title;
  HomePage({Key key,this.title}):super(key:key);

  @override
  _HomePageState createState()=>new _HomePageState();
}
class _HomePageState extends State<HomePage>{
  Future<List<User>> _getUsers() async{
    const URL='http://www.json-generator.com/api/json/get/cfuiTBwoVu?indent=2';
    var data=await http.get(URL);
    var jsonData=json.decode(data.body);
    List<User> users=[];
    for(var user in jsonData)
      {
        User u=User(user['index'],user['name'],user['picture'],user['age']);
        users.add(u);
      }
    return users;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future:_getUsers(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder:(BuildContext context,int index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].picture
                        ),
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text('Age ${snapshot.data[index].age}'),
                      onTap: (){
                        Navigator.push(context,
                            new MaterialPageRoute(
                            builder: (context)=>
                                DetailPage(snapshot.data[index])));
                      },
                    );
                  }
              );
            }

          },
        ),
      ),
    );
  }
}
