import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../utilities/constants.dart';
import '../utilities/CustomDrawer.dart';
import '../widgets/ProgressIndicator.dart';
import '../utilities/parameters.dart' as tCalculator;
import 'package:flutter_svg/flutter_svg.dart';
import '../InputScreens/AmbientTemperaturePage.dart';
import '../InputScreens/CircumferencePage.dart';

class EnclosurePage extends StatefulWidget {
  static String id = 'EnclosurePageId';
  @override
  _EnclosurePageState createState() => _EnclosurePageState();
}

class _EnclosurePageState extends State<EnclosurePage> {
  bool enclosure = false;
  bool insideOverlay = false;
  bool outsideOverlay = false;
  int _valueInside = 1;
  int _valueOutside = 1;

  final cDrawer = CustomDrawer();
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
                padding: EdgeInsets.only(top:15, right: 15, left:15, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                        child: Container(
                          color: kInactiveCardColour,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                      'Enclosure',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                          ),
                        )),
                    SizedBox(height: 15,),
                    Container(
                      width: double.infinity,
                      color: kInactiveCardColour,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Enclosure: ',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(width: 95,),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: enclosure
                                    ? kActiveSwitchColor
                                    : Color(0xffFF1744),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  AnimatedPositioned(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOut,
                                    top: 3,
                                    left: enclosure ? 30 : 0,
                                    right: enclosure ? 0 : 30,
                                    child: InkWell(
                                      onTap: toggleAction,
                                      child: AnimatedSwitcher(
                                        duration: Duration(milliseconds: 200),
                                        transitionBuilder: (Widget child,
                                            Animation<double> animation) {
                                          return RotationTransition(
                                            child: child,
                                            turns: animation,
                                          );
                                        },
                                        child: enclosure
                                            ? Icon(
                                                Icons.check_circle,
                                                color: Colors.white,
                                                key: UniqueKey(),
                                                size: 25,
                                              )
                                            : Icon(
                                                Icons.cancel,
                                                key: UniqueKey(),
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    enclosure
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              color: kInactiveCardColour,
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('Inside:', style: TextStyle(fontSize: 17)),
                                    SizedBox(width: 80,),
                                    Wrap(
                                      spacing: 10,
                                      children: List<Widget>.generate(
                                        2,
                                            (int index) {
                                          return ChoiceChip(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            selectedColor: kActiveSwitchColor,
                                            labelStyle: TextStyle(fontSize: 15),
                                            label: Text(myChoices[index]),
                                            selected: _valueInside == index,
                                            onSelected: (bool selected) {
                                              setState(() {
                                                _valueInside = selected ? index : index;
                                                _valueInside == 0
                                                    ? insideOverlay = true
                                                    : insideOverlay = false;
                                                insideOverlay
                                                    ? print(
                                                    'Painted From inside')
                                                    : print(
                                                    'blank from inside');
                                              });
                                            },
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: double.infinity,
                              color: kInactiveCardColour,
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Outside: ', style: TextStyle(fontSize: 17)),
                                    SizedBox(width: 62,),
                                    Wrap(
                                      spacing: 10,
                                      children: List<Widget>.generate(
                                        2,
                                            (int index) {
                                          return ChoiceChip(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            selectedColor: kActiveSwitchColor,
                                            labelStyle: TextStyle(fontSize: 15),
                                            label: Text(myChoices[index]),
                                            selected: _valueOutside == index,
                                            onSelected: (bool selected) {
                                              setState(() {
                                                _valueOutside = selected ? index : index;
                                                _valueOutside == 0
                                                    ? outsideOverlay = true
                                                    : outsideOverlay = false;
                                                outsideOverlay
                                                    ? print(
                                                    'Painted From Outside')
                                                    : print(
                                                    'blank from outside');
                                                print(_valueOutside);
                                              });
                                            },
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        : SizedBox(height: 122,),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(top:10, bottom: 10, left: 30, right: 30 ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: outsideOverlay?Border.all(width: 4, color: Colors.white):null
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: enclosure?Border.all(width: 10, color: Colors.blueAccent):null
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: insideOverlay?Border.all(width: 5, color: Colors.white):null
                            ),
                            child: SvgPicture.asset(
                              cDrawer.displayBusBarsWithArgument(
                                  tCalculator.parameters.getNoB()),
                              height: 100,
                              color: tCalculator.parameters.getBOverlay()?Colors.grey:tCalculator.parameters.getMaterial()
                                  ==MaterialCA.copper?kCopperColor:kAluColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    ProgressIdicator(currentStep: 6,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          child: Text('Back'),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          color: kInactiveCardColour,
                        ),
                        FlatButton(
                          child: Text('Next'),
                          onPressed: (){
                            print('Enclosure: $enclosure');
                            print('Outside Overlay: $outsideOverlay');
                            print('Inside Overlay: $insideOverlay');
                            tCalculator.parameters.setEnclosure(enclosure: enclosure);
                            tCalculator.parameters.setIOverlay(insideOverlay: insideOverlay);
                            tCalculator.parameters.setOOverlay(outsideOverlay: outsideOverlay);

                            if(enclosure){Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EnclosurePerimeterPage()),);}
                            else{
                              Navigator.pushNamed(context, AmbientTemperaturePage.id);
                            }
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

  toggleAction() {
    setState(() {
      enclosure = !enclosure;
      print('Enclosure: $enclosure');
      print('Outside Overlay: $outsideOverlay');
      print('Inside Overlay: $insideOverlay');
      if (enclosure == false) {
        insideOverlay = false;
        outsideOverlay = false;
        _valueOutside=1;
        _valueInside=1;
      }
    });
  }
}
