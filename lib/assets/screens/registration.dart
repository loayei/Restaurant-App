import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/screen_nav.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/providers/auth.dart';
import 'package:restaurants_app/assets/widgets/loading.dart';
import 'package:restaurants_app/assets/widgets/title.dart';
import 'package:provider/provider.dart';

import 'initial.dart';
import 'login.dart';

class RegisterationScreen extends StatefulWidget {
  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      body: authProvider.status == Status.Authenticating? Loading(): SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "image/logo.png",
                  width: 240,
                  height: 240,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.name,
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: InputBorder.none,
                        icon: Icon(Icons.person_outline)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        icon: Icon(Icons.email_outlined)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_outline)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: ()async{
                  if(!await authProvider.signUp()){
                    // ignore: deprecated_member_use
                    _key.currentState.showSnackBar(
                        SnackBar(content: Text("SIGN UP was unsuccessful"))
                    );
                    return;
                  }
                  authProvider.cleanControllers();
                  changeScreenReplacement(context, Initial());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: red,
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(top:10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: "Register", color: white, size: 22,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                changeScreen(context, LoginScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Login", size: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
