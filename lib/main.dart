import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/Dday.dart';
import 'package:flutter3/Dice.dart';
import 'package:flutter3/provider/count_provider.dart';
import 'package:flutter3/Second.dart';
import 'package:flutter3/firebase_options.dart';
import 'package:flutter3/provider/movie_provider.dart';
import 'package:flutter3/ui/movie_ui.dart';
import 'package:flutter3/provider/bottom_navi_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'ui/count_ui.dart';

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
        home: MultiProvider(providers: [
          ChangeNotifierProvider(
              create: (_) => CountProvider()),
          ChangeNotifierProvider(
              create: (_) => BottomNaviProvider()),
          ChangeNotifierProvider(
              create: (_) => MovieProvider()),
        ],
          child: const pTest(),
        ));
  }
}

class pTest extends StatelessWidget {
  const pTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountProvider c = Provider.of<CountProvider>(context);
    BottomNaviProvider bottom = Provider.of<BottomNaviProvider>(context);

    Widget _NavigationBody() {
      switch (bottom.current) {
        case 0:
          return Count();
        case 1:
          return Movie();
      }
      return Container();
    }

    return Scaffold(
      body: _NavigationBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'movie',
          ),
        ],
        currentIndex: bottom.current,
        onTap: (index) {
          bottom.updatePage(index);
        },
      ),
    );
  }
}

/*
class getTest extends StatelessWidget {
  const getTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getController c = Get.put(getController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(c.text.value)),
            ElevatedButton(
                onPressed: () {
                  c.click();
                },
                child: Text('change')),
            ElevatedButton(
                onPressed: () {
                  Get.to(Second());
                },
                child: Text('next page')),
            ElevatedButton(
                onPressed: () {
                  Get.to(Dday());
                },
                child: Text('Dday page')),
            ElevatedButton(
                onPressed: () {
                  Get.to(Dice());
                },
                child: Text('Dice page')),
            ElevatedButton(
                onPressed: () {
                  ChangeNotifierProvider(
                    create: (context) {
                      CountProvider();
                    },
                    child: Count(),
                  );
                },
                child: Text('count provider')),
          ],
        ),
      ),
    );
  }
}

class getController extends GetxController {
  RxString text = 'first'.obs;

  void click() {
    text.value == 'first' ? text.value = 'second' : text.value = 'first';
  }
}*/
