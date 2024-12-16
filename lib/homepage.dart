import 'package:asyn_await_app/page2.dart';
import 'package:asyn_await_app/page3.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const Text('HomePage',style: TextStyle(
            fontSize: 30
          ),),
          const SizedBox(height: 60),
          btnPage2(context),
          btnPage3(context),
        ],
      ),
    ),
    );
  }

  Widget btnPage2(BuildContext ctx) => TextButton(
    onPressed: () async{
      var value = await Navigator.pushNamed(ctx, '/page2' ,arguments: 456);
       
      myAlert(ctx, 'ค่าที่ส่งกลับมาคือ: $value ');
    }, 
    child: const Text('Go To Page 2 >>>')
    );

    Widget btnPage3(BuildContext ctx) => TextButton(
    onPressed: () async{
      List <dynamic>? values = await Navigator.pushNamed(
        ctx, '/page3',
        arguments:{'num':555,'text':'hahaha','boolean':false});
        
      myAlert(ctx, 'ค่าที่ส่งกลับมาคือ: $values}');
    }, 
    child: const Text('Go To Page 3 >>>')
    );

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