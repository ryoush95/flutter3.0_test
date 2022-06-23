import 'package:flutter/material.dart';
import 'package:flutter3/Second.dart';
import 'package:flutter3/provider/count_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountProvider c = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('count')),
      body: Center(
        child: Column(
          children: [
            // Text(context.watch().count()),
            Consumer<CountProvider>(builder: (context, provider, child) {
              return Text(c.count.toString());
            }),
            ElevatedButton(
              onPressed: () {
                c.plus();
              },
              child: const Text('up'),
            ),
            ElevatedButton(
              onPressed: () {
                c.minus();
              },
              child: const Text('down'),
            ),
            ElevatedButton(
              onPressed: () {
                ChangeNotifierProvider(
                  create: (_) => CountProvider(),
                  child: Second(),
                );
              },
              child: const Text('second'),
            ),
          ],
        ),
      ),
    );
  }
}
