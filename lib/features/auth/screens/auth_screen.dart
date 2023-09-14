import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_txtield.dart';
import '../../../main_app.dart';


class AuthScreen extends StatefulWidget {
  static const String routeName =
      '/auth-screen'; //this is the route name that we use to identify the routes
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Align content in the center vertically
                children: [
                  Image.asset('assets/images/divologo.png'),
                  Container(
                    padding: const EdgeInsets.all(40),
                    child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            Textfield(
                              controller: _emailcontroller,
                              label: 'Email',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Textfield(
                              controller: _passwordcontroller,
                              label: 'password',
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Button(
                                text: 'Sign In',
                                onTap: () {
                                  //logic and then redirect  TO-DO !!

                                  Navigator.pushNamed(
                                      context, MainApp.routeName);
                                }),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
