import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

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
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                          // maleCardColor = maleCardColor == inactiveCardColor? activeCardColor : inactiveCardColor;
                          // femaleCardColor = inactiveCardColor;
                          // updateColor(Gender.male);
                        });
                        print("male button was pressed");
                      },
                      color: selectedGender == Gender.male? activeCardColor : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                          // femaleCardColor = femaleCardColor == inactiveCardColor? activeCardColor : inactiveCardColor;
                          // maleCardColor = inactiveCardColor;
                          // updateColor(Gender.female);
                        });
                      },
                      color: selectedGender == Gender.female? activeCardColor : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
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


