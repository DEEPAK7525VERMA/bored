import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 
import 'icon_content.dart';
import 'reusable_card.dart';
const activeCardColor=Color(0xFF1D1E33);
const inactiveCardColor=Color(0xFF111328);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;
  int ?height=170;
  
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
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
        Expanded(child:ReusableCard(colour:activeCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
          Text("HEIGHT",
           style: TextStyle(fontSize:20.0),),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(height.toString(),
              style: TextStyle(fontSize:40.0,
              fontWeight:FontWeight.w900,),
              ),
              Text("cm",
              style: TextStyle(fontSize:40.0,
              fontWeight:FontWeight.w900,), 
              )
            ],
          ),
          Slider(value:(height??170).toDouble(),
           min: 120,
           max: 220,
           activeColor: Color(0xFFEB1555),
           inactiveColor: Color(0xFF8D8E98),
           onChanged:(double newValue){
               setState(() {
                 height=newValue.toInt();
               });
               
           }
            ),
        ],),
        ) ),
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


