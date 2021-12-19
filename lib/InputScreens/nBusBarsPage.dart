import 'package:flutter/material.dart';
import 'NPhaseSystem.dart';
import '../widgets/appbar.dart';
import '../utilities/constants.dart';
import '../utilities/CustomDrawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/roundedbutton.dart';
import '../widgets/ProgressIndicator.dart';
import '../utilities/parameters.dart' as tCalculator;



class NBusBarsPage extends StatefulWidget {
  static String id = 'nBusBarsPage';
  @override
  _NBusBarsPageState createState() => _NBusBarsPageState();

}

class _NBusBarsPageState extends State<NBusBarsPage> {

  final cDrawer = CustomDrawer(); // an instance of our drawing class

  int numberOfBusBars=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: myAppBar(),
  ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:15,left: 15, right: 15, bottom: 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: kInactiveCardColour,
                      child: const Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Number of Busbars',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),

                    SvgPicture.asset(
                      cDrawer
                          .displayBusBars(), // The address of the SVG icon stored in String
                      height: 140,
                      color: cDrawer.getSelectedMaterial() ==
                          MaterialCA.copper
                          ? kCopperColor
                          : kAluColor,
                    ),
                    const SizedBox(height: 30,),
                    Text(
                      cDrawer.getNumberOfBusBars().toString(),
                      style: kNumberTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedButton(
                            icon: Icons.add,
                            onLongPress: (){
                              setState(() {
                                cDrawer.longPressBusBar();
                                numberOfBusBars=cDrawer.getNumberOfBusBars();
                              });
                              print('The Number of Busbars is: $numberOfBusBars');
                            },
                            onPress: () {
                              setState(() {
                                cDrawer.increaseBusBars();
                                numberOfBusBars=cDrawer.getNumberOfBusBars();
                              });
                              print('The Number of Busbars is: $numberOfBusBars');
                            },
                          ),
                          const SizedBox(width: 15,),
                          RoundedButton(
                            onLongPress: ()=>{},
                            icon: Icons.remove,
                            onPress: () {
                              setState(()
                              {
                                cDrawer.decreaseBusBars();
                                numberOfBusBars=cDrawer.getNumberOfBusBars();
                              }
                              );
                              print('The Number of Busbars is: $numberOfBusBars');
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ProgressIdicator(currentStep: 0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          child: Text('Back'),
                          onPressed: (){


                          },
                          color: kInactiveCardColour,
                        ),
                        FlatButton(
                          child: Text('Next'),
                          onPressed: (){
                            print('The Number of Busbars is: $numberOfBusBars');
                            tCalculator.parameters.setNOB(numberOfBusBars: numberOfBusBars);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NPhasePage()),
                            );
                          },
                          color: kInactiveCardColour,
                        )
                      ],
                    )
                  ],
                ),

            ),
          ),

        ],
      ),
    );
  }
}
