import 'package:flutter/material.dart';
import 'package:splash_screen/home.dart';
import 'package:splash_screen/model/gobal.dart';

class FullImage extends StatefulWidget {
  const FullImage({ Key? key }) : super(key: key);

  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {

  PageController _pageController = new PageController(initialPage: Global.Index);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      Container(
        
        child: 
        

      

      PageView.builder(
        
        controller: _pageController,
        itemCount: Global.photos.length,
       itemBuilder: (context, index) {
    //      Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const MyHomePage()),
    // );
        return Container(
         
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(Global.photos[index].src!.portrait!), fit: BoxFit.cover),
            
          ),
          
        
          
        );
        
     
       

       },
         
      ),

      // Container(
       
      //   child: Column(children: [
          
      //     Text('Set Wallpaper', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      //   ],),
      // ),

          
        ),
      
    );
  }

  @override
  
}

 