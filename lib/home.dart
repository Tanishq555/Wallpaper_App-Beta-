import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splash_screen/model/gobal.dart';
import 'package:splash_screen/model/model.dart';
import 'package:splash_screen/model/search.dart';
import 'package:splash_screen/widget/fullscreen.dart';
import 'package:splash_screen/widget/widget.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _searchController = TextEditingController();


getWallpapers() async{
   await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=301&page=1"),
  headers: {
    "Authorization" : "563492ad6f917000010000018ca2cdcfd247454ea151ff51d53d8184"
    
  }).then((response){
    print(response.body);

    var parsedJson = json.decode(response.body);

    Global.photos = (parsedJson['photos'] as List).map((data) => Photos.fromJson(data)).toList();
  });

  setState(() {
    
  });
}

 @override
  void initState() {
    
    super.initState();
    getWallpapers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
      ),
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        child: Container(child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                
                children: <Widget>[
                  Expanded(
                    
                    child: Container(
                      
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.pink[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          
                        ),
                      ),
                      
                    ),
                    
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Search(searchQuery: _searchController.text,)));
                    },
                  )
                 ,
                ],
              ),
            ),
         
            Container( 
              
            child: GridView.builder(
              
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: Global.photos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.5,
            
               ),
               
           itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
         
                  Global.Index = index;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FullImage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(Global.photos[index].src!.portrait!),
                      fit: BoxFit.cover
                    ),
                    
                  ),
                ),
                
              );
           }
               
           ),
           
      
           
           
         ),
          
      
         
         
          ],
        ),
        ),
      ),
    );
  }
}