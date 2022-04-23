import 'package:awesone_project/drawer.dart';
import 'package:awesone_project/name_card_widget.dart';
import 'package:awesone_project/pages/login_page.dart';
import 'package:awesone_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // var myText = "Change my name";
  // TextEditingController _nameController = TextEditingController();

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData()async{
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('AgriRise - Way to new Revolution'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context,LoginPage.routeName);
            },)
        ],
      ),
      body: data!=null
      ?
      ListView.builder(
        itemBuilder: (context,index){
          return ListTile(
            title: Text(data[index]["title"]),
            subtitle: Text("ID: ${data[index]["id"]}"),
            leading: Image.network(data[index]["url"]),
          );
        },
        itemCount: data.length,)
      :
      Center(child: CircularProgressIndicator(),),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // myText = _nameController.text;
          // setState(() {
            
          // });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

