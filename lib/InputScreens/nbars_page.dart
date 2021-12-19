import 'package:flutter/material.dart';
//import 'NPhaseSystem.dart';
import '../widgets/appbar.dart';
//import '../utilities/constants.dart';
//import '../utilities/CustomDrawer.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import '../widgets/roundedbutton.dart';
//import '../widgets/ProgressIndicator.dart';
//import '../utilities/parameters.dart' as t_calculator;
import '../utilities/mobile.dart';



import 'package:syncfusion_flutter_pdf/pdf.dart';

class NbusBarsPage extends StatefulWidget {
  const NbusBarsPage({Key? key}) : super(key: key);

  @override
  _NbusBarsPageState createState() => _NbusBarsPageState();
}

class _NbusBarsPageState extends State<NbusBarsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: myAppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Enter the number of busbars"),
            ElevatedButton(child: Text("press"),
            onPressed: _createPDF,)

          ],
        ),
      ),
    );
  }
  Future<void> _createPDF() async{
PdfDocument document = PdfDocument();

//Add the pages to the document
for (int i = 1; i <= 5; i++) {
  document.pages.add().graphics.drawString(
      'page$i', PdfStandardFont(PdfFontFamily.timesRoman, 11),
      bounds: Rect.fromLTWH(250, 0, 615, 100));
}

//Create the header with specific bounds
PdfPageTemplateElement header = PdfPageTemplateElement(
    Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 300));

    header.graphics.drawLine(PdfPens.black, Offset(100,100), Offset(200,100));

//Create the date and time field
PdfDateTimeField dateAndTimeField = PdfDateTimeField(
    font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)));
dateAndTimeField.date = DateTime(2020, 2, 10, 13, 13, 13, 13, 13);
dateAndTimeField.dateFormatString = 'E, MM.dd.yyyy';

//Create the composite field with date field
PdfCompositeField compositefields = PdfCompositeField(
    font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    text: '{0}      Header',
    fields: <PdfAutomaticField>[dateAndTimeField]);

//Add composite field in header
compositefields.draw(header.graphics,
    Offset(0, 50 - PdfStandardFont(PdfFontFamily.timesRoman, 11).height));

//Add the header at top of the document
document.template.top = header;

//Create the footer with specific bounds
PdfPageTemplateElement footer = PdfPageTemplateElement(
    Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 50));

//Create the page number field
PdfPageNumberField pageNumber = PdfPageNumberField(
    font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//Sets the number style for page number
pageNumber.numberStyle = PdfNumberStyle.upperRoman;

//Create the page count field
PdfPageCountField count = PdfPageCountField(
    font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//set the number style for page count
count.numberStyle = PdfNumberStyle.upperRoman;

//Create the date and time field
PdfDateTimeField dateTimeField = PdfDateTimeField(
    font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//Sets the date and time
dateTimeField.date = DateTime(2020, 2, 10, 13, 13, 13, 13, 13);

//Sets the date and time format
dateTimeField.dateFormatString = 'hh\':\'mm\':\'ss';

//Create the composite field with page number page count
PdfCompositeField compositeField = PdfCompositeField(
    font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    text: 'Page {0} of {1}, Time:{2}',
    fields: <PdfAutomaticField>[pageNumber, count, dateTimeField]);
compositeField.bounds = footer.bounds;

//Add the composite field in footer
compositeField.draw(footer.graphics,
    Offset(290, 50 - PdfStandardFont(PdfFontFamily.timesRoman, 19).height));

//Add the footer at the bottom of the document
document.template.bottom = footer;

    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, "output.pdf");
  }
}
