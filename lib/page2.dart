import 'dart:math';

import 'package:asyn_await_app/page3.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments; //รับค่าจากเพจต้นทางมา
    
    return  Scaffold(
      appBar: AppBar(
      title: const Text('Navigation'),
      centerTitle: true,
      backgroundColor: Colors.orangeAccent,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    body:  Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text('P A G E 2\nNum:$args',style: const TextStyle(
            fontSize: 30
          ),),
          const SizedBox(height: 60),
          btnPage3(context),
          btnBack(context),
        ],
      ),
    ),
    );
  }

  Widget btnPage3(BuildContext ctx) => TextButton(
    onPressed: () async{
      List <dynamic>? values = await Navigator.pushNamed(
        ctx, '/page3',
        arguments:{'num':1000000,'text':'เป็นล้านเลยหรอพี่ !!','boolean':false});
        
      myAlert(ctx, 'ข้อมูลที่ส่งกลับมาคือ: $values}');
    }, 
    child: const Text('Go To Page 3 >>>')
    );

    Widget btnBack(BuildContext ctx ) => TextButton(
      onPressed: () => Navigator.pop(ctx, Random().nextInt(100)), 
      child: const Text('<< Back'));


      void myAlert(BuildContext ctx ,String msg){
      showDialog(
        context: ctx, 
        builder: (ctx) => AlertDialog(
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(), 
              child:const Text('OK'))
          ],
          content: Text(msg),
        ));
    }
} 