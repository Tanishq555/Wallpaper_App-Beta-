import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:splash_screen/home.dart';
import 'package:splash_screen/model/gobal.dart';
import 'package:splash_screen/model/model.dart';
import 'package:splash_screen/widget/fullscreen.dart';
import 'package:splash_screen/widget/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

final String searchQuery;
Search({required this.searchQuery});

  

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
TextEditingController _searchController = TextEditingController();

  

getSearchWallpapers(String query) async{
   await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=50&page=1"),
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
    getSearchWallpapers(widget.searchQuery);
    _searchController.text = widget.searchQuery;
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
      ),
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
                        GestureDetector(
                          onTap: (){
                           getSearchWallpapers(_searchController.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(searchQuery: _searchController.text,)));
                          },
                        ),
                      ],
                    ),
                  ),
          
          
                  SizedBox(height: 16.0,),
               
                 Container( 
                      
                    child: GridView.builder(
                      
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    
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