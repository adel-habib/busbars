import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../utilities/constants.dart';
import '../widgets/ProgressIndicator.dart';
import '../utilities/parameters.dart' as tCalculator;
// TODO Validation form give error here for some reason 

class EnclosurePerimeterPage extends StatefulWidget {
  static String id = 'EnclosurePerimeterPageId';
  @override
  _EnclosurePerimeterPageState createState() => _EnclosurePerimeterPageState();
}

class _EnclosurePerimeterPageState extends State<EnclosurePerimeterPage> {
  final enclosurePerimeterController = TextEditingController(text: '1');
  final _formKey = GlobalKey<FormState>();
  double enclosurePerimeter = 1;
  bool validateHeight(String val) {return !(val.isEmpty || double.parse(val) < 0.5 || double.parse(val) > 10);}

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    enclosurePerimeterController.dispose();
    super.dispose();
  }

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
                padding: EdgeInsets.only(top:15, right: 15, left:15, bottom: 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:20, right: 20, bottom: 5, top: 10),
                        child: Center(
                            child: Container(
                              color: kInactiveCardColour,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Perimeter of Enclosure',
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child:  Padding(
                                padding: const EdgeInsets.all(25),
                                child: TextFormField(
                                  controller: enclosurePerimeterController,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 18),
                                    helperStyle: TextStyle(fontSize: 15, color: Colors.white),
                                    labelStyle: TextStyle(fontSize: 20,),
                                    suffixStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),
                                    labelText: 'Perimeter Of Enclosure',
                                    suffixText: 'm',
                                    helperText: '0.5... 10 m',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    // Allowing the user to only input max 3 digits
                                    // LengthLimitingTextInputFormatter(3), // TODO 
                                  ],
                                  /*
                                  validator: (value) {
                                    if (!validateHeight(value))
                                      return 'Invalid Perimeter, 0.5... 10 m';
                                  },
                                  onSaved: (value) => setState(() =>
                                  validateHeight(value)
                                      ? enclosurePerimeter = double.parse(value)
                                      : value = value),
                                      */
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 255,),
                      ProgressIdicator(currentStep: 7,),
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

                              // TODO ERROR here
                              /*

                              _formKey.currentState.validate();
                              _formKey.currentState.save();
                              print('The Perimeter of the enclosire is: $enclosurePerimeter');
                              if (validateHeight(enclosurePerimeterController.text))  {
                                tCalculator.parameters.setEnclosurePerimeter(enclosurePerimeter: enclosurePerimeter.round());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AmbientTemperaturePage()),
                                );
                              }
                              */
                            },
                            
                            color: kInactiveCardColour,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }

}
