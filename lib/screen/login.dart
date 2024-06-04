import 'package:fav_app_with_provider_flutter/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  showToastFun(){

    CircularProgressIndicator(color: Colors.white);

    Fluttertoast.showToast(
        msg: "Logged In",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    ValueNotifier<bool> _toggle = ValueNotifier(false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email '),
            ),
            SizedBox(
              height: 20,
            ),


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




            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: authProvider.loading ?  showToastFun() : Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
