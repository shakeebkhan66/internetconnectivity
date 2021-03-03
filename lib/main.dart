import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  StreamSubscription connectivitySubscription;
  ConnectivityResult oldresult;

  @override
  void initState(){
    super.initState();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult resnow){
    if(resnow == ConnectivityResult.none){
      print("Not Connected");
    }
    else if(oldresult == ConnectivityResult.none){
      if(resnow == ConnectivityResult.mobile){
        print("Mobile Connectivity");
      }
      else if(resnow == ConnectivityResult.wifi){
        print("WiFi Connection");
      }
    }
    });
  }

  @override
  void dispose()
  {
    super.dispose();
    connectivitySubscription.cancel();
  }

  // Socket Method to Check Internet Connectivity
 // void checkconnection() async {
 //   try{
 //     final result = await InternetAddress.lookup('google.com');
 //     if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
 //       print('You are connected with the internet');
 //     }
 //   } on SocketException catch(_){
 //     print("You're not connected with the internet");
 //   }
 // }

  // How to check internet connectivity through Internet Package
  // void checkconnection() async{
  //   var connectionresult = await (Connectivity().checkConnectivity());
  //   if(connectionresult == ConnectivityResult.none){
  //     print("You're not connected with the internet");
  //   }
  //   else if(connectionresult == ConnectivityResult.wifi){
  //     print("You're connected with the wifi internet");
  //   }
  //   else if(connectionresult == ConnectivityResult.mobile){
  //     print("You're connected with the internet of Mobile Phone");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Status',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                splashColor: Colors.blueGrey,
                onPressed: (){
                  print("Shakeeb Khan");
                },
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Check',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Cursive',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}