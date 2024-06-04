import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false ;
  bool get loading => _loading;


  setLoading(bool value){

    _loading = value ;
    notifyListeners();

  }

  bool _obsecure = false ;
  bool get obsecure => _obsecure;


  setObsecure(bool value){

    _obsecure = value ;
    notifyListeners();

  }

  void login(String email, String password) async {

      setLoading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });

      if(response.statusCode == 200)
        {
          print('Successfull');
          setLoading(false);
        }else
          {
            print('Failed');
            setLoading(false);
          }
    } catch (e) {

      setLoading(false);
      print(e.toString());
    }
  }
}