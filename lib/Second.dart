import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final txc = TextEditingController();
  String title = '';
  RxList list = [].obs;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    txc.dispose();
    super.dispose();
  }

  void init() async {
    list.clear();
    await FirebaseFirestore.instance.collection('board').orderBy('timestamp', descending: true).get().then(
        (value) => value.docs.forEach((e) =>
            list.add(Model(id: e.id, title: e.data()['title'], user: e.data()['user']))),
    );
    print(list.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: txc,
          ),
          ElevatedButton(
              onPressed: () {
                if (txc.text.isNotEmpty) {
                  FirebaseFirestore.instance
                      .collection('board')
                      .add({
                        'title': txc.text,
                        'timestamp': Timestamp.now(),
                        'user': ''
                      })
                      .then((value) {txc.text = '';
                        init();
                  })
                      .catchError((error) => print(error));
                } else {
                  Get.snackbar('error', '',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('upload')),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('back')),
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int i) {
                return InkWell(
                  onTap: () {
                    Get.snackbar(list[i].id, list[i].title);
                  },
                  child: Column(
                    children: [
                      Text(list[i].user),
                      SizedBox(
                        height: 50,
                        child: Text(list[i].title),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 2,
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}

class Model {
  String? id;
  String? title;
  String? user;

  Model({
    required String this.id,
    required String this.title,
    required String this.user,
  });
}
