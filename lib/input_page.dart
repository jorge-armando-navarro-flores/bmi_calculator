import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  //
  // void updateColor(Gender gender){
  //   if(gender == Gender.male){
  //     if(maleCardColor == inactiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     }else{
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //
  //   if(gender == Gender.female){
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     }else{
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.male;
                          // maleCardColor = maleCardColor == inactiveCardColor? activeCardColor : inactiveCardColor;
                          // femaleCardColor = inactiveCardColor;
                          // updateColor(Gender.male);
                        });
                        print("male button was pressed");
                      },
                      child: ReusableCard(
                        color: selectedGender == Gender.male? activeCardColor : inactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: "Male",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.female;
                          // femaleCardColor = femaleCardColor == inactiveCardColor? activeCardColor : inactiveCardColor;
                          // maleCardColor = inactiveCardColor;
                          // updateColor(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        color: selectedGender == Gender.female? activeCardColor : inactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: "Female",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(color: activeCardColor),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}


