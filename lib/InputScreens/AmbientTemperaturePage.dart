import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../utilities/constants.dart';
import '../widgets/BackgroundCard.dart';
import '../widgets/ProgressIndicator.dart';
import '../utilities/parameters.dart' as tCalculator;
import '../InputScreens/LastInputPage.dart';

class AmbientTemperaturePage extends StatefulWidget {
  static String id = 'ambientTemperaturePageId';
  @override
  _AmbientTemperaturePageState createState() => _AmbientTemperaturePageState();
}

class _AmbientTemperaturePageState extends State<AmbientTemperaturePage> {
  double ambientTemp = 35;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: myAppBar()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child:  Padding(
                padding: EdgeInsets.only(top:15, right: 15, left:15, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    SizedBox(
                      height: 10,
                    ),
                    BackGroundCard(
                      cardChild: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Ambient Temperature',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 140,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          ambientTemp.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 40,
                              color: sliderLabelColor(ambientTemp)
                          ),
                        ),
                        Text(
                          ' °C',
                          style: TextStyle(color: sliderLabelColor(ambientTemp), fontSize: 40),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                        thumbColor: Color(0xffeb1555),
                        activeTrackColor: sliderLabelColor(ambientTemp),
                        inactiveTrackColor: Colors.grey,
                      ),
                      child: Slider(
                        value: ambientTemp,
                        min: -10,
                        max: 50,
                        onChanged: (double newValue) {
                          setState(() {
                            ambientTemp = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 190,),
                    Center(
                      child: ProgressIdicator(currentStep: 8,),
                    ),
                    SizedBox(height: 20,),
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
                            print('The ambient temperature is: ${ambientTemp.toStringAsFixed(1)}');
                            tCalculator.parameters.setATemp(ambientTemperature: ambientTemp);
                            Navigator.pushNamed(context, RdInputPage.id);
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
  Color sliderLabelColor(double val){
    if(val<-4)
      return Color(0xff2962FF);
    if(val>=-4 && val<-2)
      return Color(0xff1E88E5);
    if(val>=-2&&val<2)
      return Color(0xff2094F3);
    if(val>=2&&val<=5)
      return Color(0xff41A4F5);


    if(val>5&&val<10)
      return Color(0xff00aeb4);
    if(val>=10&&val<15)
      return Color(0xff00c8cb);
    if(val>=15&&val<20)
      return Color(0xff71e0dd);


    if(val>=20&&val<25)
      return Color(0xffFFC100);
    if(val>=25&&val<30)
      return Color(0xffFFEE00);
    if(val>=30&&val<35)
      return Color(0xffFDF166);

    if(val>=35&&val<40)
      return Color(0xffFF8A65);
    if(val>=40&&val<45)
      return Color(0xffFF5722);
    else
      return Color(0xffE64A19);

  }

}
