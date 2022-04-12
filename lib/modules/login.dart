import 'package:change_first_login/modules/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/component.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool isPassword = true;
  var controller = TextEditingController();
  var controllerpassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      width: 150.0,
                      height: 150.0,
                      image: AssetImage('assets/images/insta.png'),
                    ),
                    const Text(
                      "Welcome back!",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Login to your account',
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    defaultFormField(
                      controller: controller,
                      perfix: Icons.person,
                      type: TextInputType.emailAddress,
                      text: '\t Username',
                      function: (String value) {
                        if (value.isEmpty) {
                          return 'Username isEmpty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                        controller: controllerpassword,
                        function: (String value) {
                          if (value.isEmpty) {
                            return 'Password isEmpty';
                          }
                          return null;
                        },
                        perfix: Icons.lock,
                        type: TextInputType.visiblePassword,
                        text: '\t Password',
                        suffix: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        isPassword: isPassword,
                        suffixButton: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        }),
                    const SizedBox(
                      height: 55.0,
                    ),
                    defaultButton(
                        text: 'Sign In',
                        button: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        width: 150.0,
                        height: 40.0), //Button
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80.0,
                              height: 2.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text('Or sign in with'),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              width: 80.0,
                              height: 2.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 45.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              // border: Border.all(
                              //   color: Colors.grey,
                              //   width: 0.8,
                              // ),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage('assets/images/google.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 35.0,
                          ),
                          Container(
                            width: 60,
                            height: 45.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage('assets/images/f.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 35.0,
                          ),
                          Container(
                            width: 60,
                            height: 45.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage('assets/images/twitter.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), //Box Social Media
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const Register_Screen()));
                          },
                          child: const Text(
                            'Sign up here',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
