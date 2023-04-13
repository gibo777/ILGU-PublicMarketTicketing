import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:flutterapp/Screens/forgot_password.dart';
import 'home_screen.dart';
import 'package:flutterapp/Screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// class _LoginScreenState extends State<LoginScreen> {
//   String _email = '';
//   String _password = '';
//
//   loginPressed() async {
//     if (_email.isNotEmpty && _password.isNotEmpty) {
//       http.Response response = await AuthServices.login(_email, _password);
//       Map responseMap = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => const HomeScreen(),
//             ));
//       } else {
//         errorSnackBar(context, responseMap.values.first);
//       }
//     } else {
//       errorSnackBar(context, 'enter all required fields');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: ListView(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 50.0, bottom: 16.0, left: 16.0, right: 16.0),
//                 child: Image.asset(
//                   'assets/images/logo.png', // replace with your logo path
//                   width: 280,
//                   height: 280,
//                 ),
//               ),
//               Text(
//                 'PUBLIC MARKET TICKETING',
//                 style: TextStyle(
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 24.0, vertical: 50.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       const SizedBox(
//                         height: 48.0,
//                       ),
//                       TextFormField(
//                         textAlign: TextAlign.left,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: 'User ID or Email',
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 10.0, horizontal: 20.0),
//                           border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(32.0)),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.lightBlueAccent, width: 1.0),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(32.0)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.lightBlueAccent, width: 2.0),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(32.0)),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           _email = value;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 2.0,
//                       ),
//                       TextFormField(
//                         textAlign: TextAlign.left,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock),
//                           hintText: 'Password',
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 10.0, horizontal: 20.0),
//                           border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(32.0)),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.lightBlueAccent, width: 1.0),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(32.0)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.lightBlueAccent, width: 2.0),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(32.0)),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           _password = value;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 24.0,
//                       ),
//                       ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                               Colors.lightBlueAccent),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(32.0),
//                             ),
//                           ),
//                         ),
//                         onPressed: () => loginPressed(),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 16.0),
//                           child: Text(
//                             'LOG IN',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 16.0,
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //       builder: (context) =>
//                           //           forgotpasswordscreen()),
//                           // );
//                         },
//                         child: const Text(
//                           'Forgot Password?',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ], // <-- add this closing brace
//           ),
//         ),
//       ),
//     );
//   }
// }


class _LoginScreenState extends State<LoginScreen> {

  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/logo.png', // replace with your logo path
                    width: 275,
                    height: 275,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'PUBLIC MARKET TICKETING',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 6.0,
                    ),
                    // Text(
                    //   'Username or Email',
                    //   style: TextStyle(
                    //     fontSize: 12.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    TextField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Username',
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    // Text(
                    //   'Password',
                    //   style: TextStyle(
                    //     fontSize: 12.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      textAlign: TextAlign.left,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlue, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),

                    const SizedBox(
                      height: 3.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlue[900]!),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      // onPressed: () {
                      //   Navigator.pushReplacementNamed(context, '/home');
                      // },
                      onPressed: () => loginPressed(),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
