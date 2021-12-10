import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'widgets/appbar.dart';
import 'widgets/my_button.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: myAppBar(),
      ),
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 50,left: 15,right: 15),
        child: Column(children: [
          Row(

            children: [
              const Text("READ ME",
              style: TextStyle(fontSize: 30),
              ),
              Expanded(child: Container()),
              Icon(Icons.arrow_back_ios,size: 20,color: color.AppColor.homePageIcons,),
              const SizedBox(width: 10,),
              Icon(Icons.calendar_today_outlined,size: 20,color: color.AppColor.homePageIcons,),
              const SizedBox(width: 10,),
              Icon(Icons.arrow_forward_ios,size: 20,color: color.AppColor.homePageIcons,),
            ],
          ),
          Row(
            children: [
              Text("Your program",
              style: TextStyle(fontSize: 20,color: color.AppColor.homePageSubtitle),
        
              ),
              Expanded(child: Container()),
                      Text("Details",
              style: TextStyle(fontSize: 20,color: color.AppColor.homePageSubtitle),
        
              ),
              const Icon(Icons.arrow_forward_ios,size: 20,),
              
            ],
          ),
          Container(width: MediaQuery.of(context).size.width,

              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.grey]),
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(80),
              )),
            ),
            Mybutton(label: "hi", doSomething: ()=>{}, buttonColor: const Color(0xFF1D1E33), textColor: Colors.white)
        ],),
      ),
    );
  }
}