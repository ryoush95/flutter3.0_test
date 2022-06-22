import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/Dday.dart';
import 'package:flutter3/Dice.dart';
import 'package:flutter3/Second.dart';
import 'package:flutter3/firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const getTest(),
    );
  }
}


class getTest extends StatelessWidget {
  const getTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getController c = Get.put(getController());
    return Scaffold(
      appBar: AppBar(),
        body:Center(
          child: Column(
            
            children: [
              Obx(()=> Text(c.text.value)),
              ElevatedButton(onPressed: (){
                c.click();
              }, child: Text('change')),
              ElevatedButton(onPressed: (){
                Get.to(Second());
              }, child: Text('next page')),
              ElevatedButton(onPressed: (){
                Get.to(Dday());
              }, child: Text('Dday page')),
              ElevatedButton(onPressed: (){
                Get.to(Dice());
              }, child: Text('Dice page')),
            ],
          ),
        ),
    );
  }
}

class getController extends GetxController {
  RxString text = 'first'.obs;

  void click() {
    text.value == 'first'?text.value = 'second': text.value = 'first';
  }

}