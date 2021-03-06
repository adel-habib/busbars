import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/appbar.dart';
import '../utilities/constants.dart';
import '../widgets/BackgroundCard.dart';
import '../widgets/ProgressIndicator.dart';
import '../utilities/parameters.dart' as tCalculator;
import '../InputScreens/Enclosure.dart';
import 'dart:math';
class FrequencyPage extends StatelessWidget {
  static const id = 'FreqPageId';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: myAppBar()),
      body: FreqPageBody(),
    );
  }
}
class FreqPageBody extends StatefulWidget {
  @override
  _FreqPageBodyState createState() => _FreqPageBodyState();
}

class _FreqPageBodyState extends State<FreqPageBody> {
  double freq=50.00;

  late TextEditingController myFreqController;
  void initState() {
    myFreqController = TextEditingController(text: '$freq');
    super.initState();

  }
  @override
  void setState(fn) {
    myFreqController = TextEditingController(text: '${freq.toStringAsFixed(2)}');
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:15, left:15, right: 15, bottom: 0),
                child: BackGroundCard(
                  cardChild: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Text(
                                'Frequency',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                freq.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                ' Hz',
                                style: TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                              thumbColor: Color(0xffeb1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            ),
                            child: Slider(
                              value: freq,
                              min: minFreq.toDouble(),
                              max: maxFreq.toDouble(),
                              onChanged: (double newValue) {
                                print('The Frequency is: ${freq}');
                                setState(() {
                                  freq = newValue;

                                });
                              },
                            ),
                          ),
                          Form(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(right: 40, left: 40, bottom: 5),
                                child: TextFormField(
                                  controller: myFreqController,
                                  keyboardType: TextInputType.numberWithOptions(signed: false),
                                  inputFormatters: [DecimalTextInputFormatter(decimalRange: 2),
                                  ],
                                  onChanged: (value){
                                    if(double.parse(value)>=0 && double.parse(value)<400)
                                      setState(() {
                                        freq=double.parse(value);
                                      });

                                  },
                                  decoration: InputDecoration(

                                    hintText: 'Write two decimal-number',
                                    helperText: '0... 400 Hz',
                                    labelText: 'Enter a specific Value',
                                    suffixText: 'Hz',

                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: BackGroundCard(
                cardChild: Padding(
                  padding: const EdgeInsets.only(left:12.0, right: 12.0,),
                  child: CustomPaint(
                    size: Size(double.infinity, 160),
                      painter: SinPainter(freq),
                    ),
                ),
              ),
            ),
              SizedBox(height: 86,),


              ProgressIdicator(currentStep: 5,),
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
                      print('The frequency is: ${freq.toStringAsFixed(2)}');
                      tCalculator.parameters.setFrequency(frequency: freq);
                      Navigator.pushNamed(context, EnclosurePage.id);
                    },
                    color: kInactiveCardColour,
                  )
                ],
              ),



            ],

          ),
        ),
      ),
    );
  }
}


class SinPainter extends CustomPainter{

  final double freq;
  SinPainter(this.freq);

  @override void paint(Canvas canvas, Size size){
    final midY = size.height/2;
    final paint = Paint()..style = PaintingStyle.fill
      ..color = Colors.tealAccent
      ..strokeWidth = 3;
  if(freq==0){
    canvas.drawLine(Offset(0,midY-50), Offset(size.width,midY-50), paint);}

    var pt = Offset(0,midY);
    if(freq!=0){
    for(double i=0;i<size.width;i+=0.1){
      final npt = Offset(i,midY-sin(i/(sqrt(470)-sqrt(freq)))*55);

      canvas.drawLine(pt, npt, paint);
      pt = npt;
    }}
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, // unused.
      TextEditingValue newValue,
      ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: min(truncated.length, truncated.length + 1),
          extentOffset: min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}