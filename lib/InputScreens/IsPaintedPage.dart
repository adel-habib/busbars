import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/appbar.dart';
import '../utilities/constants.dart';
import '../utilities/CustomDrawer.dart';
import '../widgets/ProgressIndicator.dart';
import '../utilities/parameters.dart' as tCalculator;
import '../widgets/BackgroundCard.dart';



class IsPaintedPage extends StatefulWidget {
  static String id = 'IsPaintedPageId';
  @override
  _IsPaintedPageState createState() => _IsPaintedPageState();
}

class _IsPaintedPageState extends State<IsPaintedPage> {
  final cDrawer = CustomDrawer();
  bool busbarOverlay = false;
  int _value = 1;
  List<String> myChoices = ['Painted', 'Blank'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: myAppBar()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                      child: Container(
                    color: kInactiveCardColour,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Surface',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: BackGroundCard(
                      cardChild: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'The Busbar is',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Wrap(
                                  spacing: 10,
                                  children: List<Widget>.generate(
                                    2,
                                    (int index) {
                                      return ChoiceChip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        selectedColor: kActiveSwitchColor,
                                        labelStyle: TextStyle(fontSize: 19),
                                        label: Text(myChoices[index]),
                                        selected: _value == index,
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _value = selected ? index : 0;
                                            _value == 0
                                                ? busbarOverlay = true
                                                : busbarOverlay = false;
                                            tCalculator.parameters.setBOverlay(
                                                busBarOverlay: busbarOverlay);
                                            busbarOverlay
                                                ? print(
                                                    'The Busbars are painted')
                                                : print(
                                                    'The Busbars are blank');
                                          });
                                        },
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          cDrawer.displayBusBarsWithArgument(
                              tCalculator.parameters.getNoB()
                          ),
                          height: 140,
                          color: barColor(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ProgressIdicator(
                    currentStep: 4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        child: Text('Back'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: kInactiveCardColour,
                      ),
                      FlatButton(
                        child: Text('Next'),
                        onPressed: () {
                          /*
                          tCalculator.parameters
                              .setBOverlay(busBarOverlay: busbarOverlay);
                          Navigator.pushNamed(context, FrequencyPage.id);
                          */
                        },
                        color: kInactiveCardColour,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Color barColor() {
    if (!busbarOverlay) {
      return tCalculator.parameters.getMaterial() == MaterialCA.copper
          ? kCopperColor
          : kAluColor;
    }
    if (busbarOverlay) {
      return Colors.black;
    }
    return Colors.black;
  }
}
