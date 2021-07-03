import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int? height;
  int? weigth;
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                          // maleCardColor = maleCardColor == inactiveCardColor? activeCardColor : inactiveCardColor;
                          // femaleCardColor = inactiveCardColor;
                          // updateColor(Gender.male);
                        });
                        print("male button was pressed");
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                          // femaleCardColor = femaleCardColor == inactiveCardColor? activeCardColor : inactiveCardColor;
                          // maleCardColor = inactiveCardColor;
                          // updateColor(Gender.female);
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
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
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height?.toString()?? "180",
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFeB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0
                        )
                      ),
                      child: Slider(
                        value: height?.toDouble()?? 180.0,
                        min: 120,
                        max: 220,
                        onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });

                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGTH",
                              style: kLabelTextStyle,
                            ),
                            Text(weigth?.toString()?? "60",
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  onPressed: (){},
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,

                                  ),
                                ),
                                SizedBox(width: 10.0),
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  onPressed: (){},
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,

                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
