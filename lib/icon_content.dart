import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
   final IconData d;
   final String gender;
   IconContent({required this.d,required this.gender});
    
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        d,
        size:80 ,
      ),
      SizedBox(
        height:20.0,
      ),
      Text(gender,
      style: TextStyle(fontSize:18.0),), 
    ],);
  }
}