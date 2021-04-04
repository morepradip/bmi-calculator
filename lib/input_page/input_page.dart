import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;

  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        elevation: 8.0,
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: _buildGenderRow(),
        ),
        Expanded(
          child: ReusableCard(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildHeightColumn(),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(),
              ),
              Expanded(
                child: ReusableCard(),
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
    );
  }

  Column _buildHeightColumn() {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kDataText,
                    ),
                    SizedBox(width: 2.0,),
                    Text('cm'),
                  ],
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFE91E63),
                      overlayColor: Color(0x29E91E63),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey[600],
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
  }

  Row _buildGenderRow() {
    return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    gender = Gender.male;
                  });
                },
                child: ReusableCard(
                  color: gender == Gender.male ? activeColor : inActiveColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.mars,
                    cardName: 'MALE',
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    gender = Gender.female;
                  });
                },
                child: ReusableCard(
                  color:
                      gender == Gender.female ? activeColor : inActiveColor,
                  child: IconContent(
                    iconData: FontAwesomeIcons.venus,
                    cardName: 'FEMALE',
                  ),
                ),
              ),
            ),
          ],
        );
  }
}
