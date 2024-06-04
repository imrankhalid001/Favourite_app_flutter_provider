import 'dart:ffi';

import 'package:flutter/material.dart';


class NotifierListenerScreen extends StatelessWidget {
   NotifierListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier(0);
   ValueNotifier<bool> _toggle = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Notifier Screen'),
      ),

      body: Column(
        children: [
          
          ValueListenableBuilder(valueListenable: _toggle, builder: (context, value, child ){
            return           TextFormField(
              obscureText: _toggle.value,
              decoration: InputDecoration(
                hintText: 'password',
                suffix: InkWell(
                    onTap: () {
                      _toggle.value = !_toggle.value;
                    },
                    child: Icon(_toggle.value ? Icons.visibility_off : Icons.visibility,

                    )

                ),

              ),
            );

          }),

          

          Center(
            child: ValueListenableBuilder(valueListenable: _counter,
                builder: (context , value, child){
                  return Text(_counter.value.toString(), style: TextStyle(fontSize: 30),);
                }
            ),

          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
      },

        child:Icon(Icons.add),
      ),
    );
  }
}
