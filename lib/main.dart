import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/assets/providers/auth.dart';
import 'package:restaurants_app/assets/screens/initial.dart';
import 'package:restaurants_app/assets/screens/login.dart';
import 'package:restaurants_app/assets/widgets/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AuthProvider.initialize())
  ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScreenSwitcher()
    )));
}

class ScreenSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    //Checking state of the widget
    switch(auth.status){
      case Status.Uninitialized:
        //If status is not initialized we will call the loading widget.
      return LoginScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        //While the process of authentication is running we will call the LoginScreen
        return Loading();
      case Status.Authenticated:
        //If authenticated successfully Screen will be switched to home screen called Initial
        return Initial();
      default: return LoginScreen();


    }
  }
}
