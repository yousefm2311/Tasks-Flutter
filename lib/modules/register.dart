import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/component.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({Key? key}) : super(key: key);

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  var  controller =TextEditingController();
  var  controlleremail =TextEditingController();
  var  controllerpassword =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                  "Welcome!",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Create your account',
                ),
                const SizedBox(
                  height: 30.0,
                ),
                defaultFormField(
                  controller: controller,
                  perfix: Icons.person,
                  type: TextInputType.emailAddress,
                  text: 'Username',
                  function: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultFormField(
                  controller: controlleremail,
                  perfix: Icons.email,
                  type: TextInputType.emailAddress,
                  text: 'Email',
                  function: (String value){
                    if(value.isEmpty){
                      return 'Email isEmpty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultFormField(
                    controller: controllerpassword,
                    function: (String value){
                      if(value.isEmpty){
                        return 'Password isEmpty';
                      }
                      return null;
                    },

                    perfix: Icons.lock,
                    type: TextInputType.visiblePassword,
                    text: 'Password',
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
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
                    text: 'Sign Up',
                    button: () {
                      if(formKey.currentState!.validate()) {

                      }
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
                const SizedBox(
                  height: 10.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
