import 'package:flt_firebase/pages/login.dart';
import 'package:flutter/material.dart';

import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool  showLoginPage = true;
  void toggelScreen(){
      setState(() {
        showLoginPage = !showLoginPage;
      });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
        return Login(showRegisterPage: toggelScreen);
    }else{
        return RegisterPage(showLoginPage: toggelScreen);
    }
  }
}
