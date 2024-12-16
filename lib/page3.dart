import 'dart:math';

import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments; //รับค่าจากเพจต้นทางมา
    var argsMap = args as Map<String , dynamic>; //convert value to map

    var v1 = argsMap['num'];
    var v2 = argsMap['text'];
    var v3 = argsMap['boolean'];
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text('P A G E 3 \nNum:$v1 \nText:$v2\nBoolean: $v3',
            style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 60),
            btnBack(context),
          ],
        ),
      ),
    );
  }

  Widget btnBack(BuildContext ctx ) => TextButton(
      onPressed: () => Navigator.pop(ctx, [123,'one-two-three']), 
      child: const Text('<< Back'));
}