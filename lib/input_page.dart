import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 
const activeCardColor=Color(0xFF1D1E33);
const inactiveCardColor=Color(0xFF111328);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;
  void updateColour(int gender){
    if(gender==1){
      if(maleCardColor==inactiveCardColor){
        maleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor; 
      }}
    else{
        maleCardColor=inactiveCardColor;
        femaleCardColor=activeCardColor;
      }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATORs'),
      ),
      body:Column(children: [
        Expanded(child:Row(children: [
          Expanded(child:GestureDetector
          (onTap:(){
setState(() {
  updateColour(1);
});
          },
            child: ReusableCard(colour:maleCardColor,cardChild: IconContent(d:Icons.male,gender:"MALE"),
            ))),
          Expanded(child:GestureDetector(
            onTap:(){
                setState((){
updateColour(2);
                });
            },
            child: ReusableCard(colour:femaleCardColor,
            cardChild: IconContent(d:Icons.female,gender:"FEMALE"),),
          )),
        ],)),
        Expanded(child:ReusableCard(colour:activeCardColor) ),
        Expanded(child:Row(children: [
          Expanded(child:ReusableCard(colour:activeCardColor)),
          Expanded(child:ReusableCard(colour:activeCardColor) ),
        ],)),
      Container(
        color:Color(0xFFEB1555),
        margin:EdgeInsets.only(top:10.0),
        height:80.0,
      ) ],)
    );
  }
}

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

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  ReusableCard({required this.colour,this.cardChild});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child:cardChild,
    
    margin:EdgeInsets.all(15.0),
      decoration: BoxDecoration(
      color:colour,
      borderRadius:BorderRadius.circular(10.0)
    ),
          );
  }
}
