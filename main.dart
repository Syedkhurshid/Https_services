import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_managment/myprovider.dart';


void main() {
  runApp(const MyApp());
}//

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}//



class MyHomePage extends StatelessWidget {
  final ageController = TextEditingController();


  @override
    Widget build(BuildContext context) {
    return ChangeNotifierProvider<Myprovider>(

      create: (context)=>Myprovider(),
      child:Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(16),
              child: Form(
                child: Consumer<Myprovider>(
                  builder: (context,provider,child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //if isEligible is null then set orange color else if it is true then set green else red
                              color: (provider.isEligible == null) ? Colors.orangeAccent : provider.isEligible ? Colors.green : Colors.redAccent
                          ),
                          height: 50,
                          width: 50,
                        ),

                        SizedBox(height: 16,),

                        TextFormField(
                          controller: ageController,
                          decoration: InputDecoration(
                            hintText: "Enter Your Marks",

                          ),
                        ),
                        SizedBox(height: 16,),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text("Check"),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {
                              print('This is working');
                              //getting the text from TextField and converting it into int
                              final int age = int.parse(ageController.text.trim());

                              //Calling the method from provider.
                              provider.checkEligiblity(age);
                            },
                          ),
                        ),
                        SizedBox(height: 16,),

                        Text(provider.eligiblityMessage)
                      ],
                    );
                  }
                ),
              ),
            ),
          );
        },),
    );

  }
}//
