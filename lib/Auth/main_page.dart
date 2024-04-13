import 'package:firebase_auth/firebase_auth.dart';
import 'package:flt_firebase/pages/login.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'auth_page.dart';


class main_page extends StatelessWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
      if(snapshot.hasData){
        return HomePage();
      }else{
        return AuthPage();
    }
    }
    );
  }
}
